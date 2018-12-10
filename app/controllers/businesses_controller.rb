class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy, :follow, :unfollow]

  def index
    @businesses = policy_scope(Business)
  end

  def show
    authorize @business
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
    @business.update(business_params)
    if @business.save
      redirect_to feed_path
    else
      render :new
    end
  end

  def destroy
    authorize @business
    @business.destroy
    redirect_to root_path
  end

  def follow
    authorize @business
    @follow = Follow.new
    @follow.followed = @business
    @follow.follower = current_user.organisation
    if @follow.save
      redirect_to business_path(@business), notice: "Now following #{@business.name}"
    else
      redirect_to business_path(@business), notice: "You are already following #{@business.name}"
    end
  end

  def unfollow
    authorize @business
    @follow = Follow.where(followed_id: @business.id, followed_type: "Business", follower_id: current_user.organisation_id, follower_type: current_user.organisation_type).first
    @follow.destroy
    if @follow.destroy
      redirect_to business_path(@business), notice: "You stopped following #{@business.name}"
    end
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :address, :website, :description, :logo, :charity_preferences)
  end
end
