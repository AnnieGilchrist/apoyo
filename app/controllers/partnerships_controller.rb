class PartnershipsController < ApplicationController
  before_action :set_partnership, only: [:show, :edit, :update, :destroy]
  before_action :set_mission, only: [:show, :new, :create]

  def index
    @partnerships = policy_scope(Partnership)
    @active_partnerships = []
    @finished_partnerships = []
    @messages = []
    @partnerships.each do |partnership|
      if partnership.status == 'completed'
        @finished_partnerships << partnership
      else
        @active_partnerships << partnership
      end
      @messages << Message.where(partnership_id: partnership.id)
    end

    @following = Follow.where(follower_id: current_user.organisation_id, follower_type: current_user.organisation_type)
    @followers = Follow.where(followed_id: current_user.organisation_id, followed_type: current_user.organisation_type)
  end

  def show
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
    if @partnership.save
      redirect_to partnerships_path, notice: 'Partnership request successfully created.'
    elsif Partnership.where(business_id: @business.id, mission_id: @mission.id).exists?
      redirect_to mission_path(@mission), notice: 'You already have an active partnership for this mission.'
    else
      redirect_to mission_path(@mission), notice: 'Failed to create partnership request.'
    end
  end

  def edit
    authorize @partnership
  end

  def update
    authorize @partnership
    @partnership.status = params[:status]
    if @partnership.save
      redirect_to partnerships_path, notice: 'status changed'
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
