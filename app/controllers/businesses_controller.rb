class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy, :follow, :unfollow]

  def index
    @businesses = policy_scope(Business)
  end

  def show
    authorize @business

    if !@business.longitude.nil? && !@business.latitude.nil?
      @marker = {
        lng: @business.longitude,
        lat: @business.latitude,
        infoWindow: { content: render_to_string(partial: "/businesses/map_window", locals: { business: @business }) }
      }
    end
    @conversation = Conversation.new
  end

  def new
    @business = Business.new
    authorize @business
  end

  def create
    @business = Business.new(business_params)
    authorize @business
    if @business.save
      current_user.organisation = @business
      current_user.save
      redirect_to feed_path, notice: 'Business successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @business
  end

  def update
    authorize @business
    if @business.update(business_params)
      redirect_to business_path(@business)
    else
      render :edit
    end
  end

  def destroy
    authorize @business
    @business.destroy
    redirect_to root_path
  end

  def follow
    authorize @business
    @organisation = @business
    @follow = Follow.new
    @follow.followed = @business
    @follow.follower = current_user.organisation
    if @follow.save
      respond_to do |format|
        format.js { render 'follows/follow.js.erb', followed: @business }
      end
    end
  end

  def unfollow
    authorize @business
    @organisation = @business
    @follow = Follow.where(followed_id: @business.id, followed_type: "Business", follower_id: current_user.organisation_id, follower_type: current_user.organisation_type).first
    if @follow.destroy
      respond_to do |format|
        format.js { render 'follows/unfollow.js.erb' }
      end
    end
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :address, :location, :website, :description, :logo, :charity_preferences, :services_offered)
  end
end
