class PartnershipsController < ApplicationController
  before_action :set_partnership, only: [:show, :edit, :update, :destroy]
  before_action :set_mission, only: [:new, :create]

  def index
    @partnerships = policy_scope(Partnership)
    @active_partnerships = []
    @finished_partnerships = []
    @partnerships.each do |partnership|
      if partnership.status == 'completed' || partnership.status == 'declined'
        @finished_partnerships << partnership
      else
        @active_partnerships << partnership
      end
    end

    @following = current_user.organisation.following
    @followers = current_user.organisation.followers
  end

  def show
    authorize @partnership
    @conversation = Message.where(partnership_id: @partnership.id)
    @conversation.map {|message| message.update(read: true)}
    @message = Message.new
    @message.sender = current_user.organisation
  end

  def new
    @partnership = Partnership.new
    authorize @partnership
  end

  def create
    @partnership = Partnership.new(partnership_params)
    authorize @partnership
    @business = current_user.organisation
    @partnership.business = @business
    @partnership.mission = @mission
    @conversation = Conversation.new
    @conversation.participant_a = @mission.charity
    @conversation.participant_b = @business
    if @partnership.save
      @conversation.partnership = @partnership
      @conversation.save
      @message = Message.new(content: "#{@partnership.details}", direction: "b-to-a")
      @message.conversation = @conversation
      @message.save
      PartnershipMailer.creation_notification_charity(@partnership).deliver_now
      PartnershipMailer.creation_notification_business(@partnership).deliver_now
      redirect_to partnerships_path, notice: 'Partnership request successfully created.'
    elsif Partnership.where(business_id: @business.id, mission_id: @mission.id).exists?
      redirect_to mission_path(@mission), notice: 'You already have an active partnership for this mission.'
    else
      redirect_to mission_path(@mission), notice: 'Failed to create partnership request. Make sure you write a message.'
    end
  end

  def edit
    authorize @partnership
  end

  def update
    authorize @partnership
    @partnership.status = params[:status]
    if @partnership.save
      if @partnership.status == "completed"
        message = "#{@partnership.mission.name} is marked as completed. Find your completed partnerships in Past Partnerships."
      elsif @partnership.status == "declined"
        message = "You've declined #{@partnership.business.name}'s request."
      else
        message = "You've accepted #{@partnership.business.name}'s request."
      end
      redirect_to partnerships_path, notice: "#{message}"
    end
  end

  def destroy
    authorize @partnership
  end

  private

  def set_partnership
    @partnership = Partnership.find(params[:id])
  end

  def set_mission
    @mission = Mission.find(params[:mission_id])
  end

  def partnership_params
    params.require(:partnership).permit(:details)
  end
end
