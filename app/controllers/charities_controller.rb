class CharitiesController < ApplicationController
  before_action :set_charity, only: [:show, :edit, :update, :destroy, :follow, :unfollow]

  def index
    @charities = policy_scope(Charity)
  end

  def show
    authorize @charity

    if !@charity.longitude.nil? && !@charity.latitude.nil?
      @marker = {
        lng: @charity.longitude,
        lat: @charity.latitude,
        infoWindow: { content: render_to_string(partial: "/charities/map_window", locals: { charity: @charity }) }
      }
    end
  end

  def new
    @charity = Charity.new
    authorize @charity
  end

  def create
    @charity = Charity.new(charity_params)
    authorize @charity
    if @charity.save
      current_user.organisation = @charity
      current_user.save
      redirect_to feed_path, notice: 'Charity successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @charity
  end

  def update
    authorize @charity
    if @charity.update(charity_params)
      redirect_to charity_path(@charity)
    else
      render :edit
    end
  end

  def destroy
    authorize @charity
    @charity.destroy
  end

  def follow
    authorize @charity
    @follow = Follow.new
    @follow.followed = @charity
    @follow.follower = current_user.organisation
    if @follow.save
      redirect_back(fallback_location: feed_path, notice: "Now following #{@charity.name}")
    else
      redirect_back(fallback_location: feed_path, notice: "You are already following #{@charity.name}")
    end
  end

  def unfollow
    authorize @charity
    @follow = Follow.where(followed_id: @charity.id, followed_type: "Charity", follower_id: current_user.organisation_id, follower_type: current_user.organisation_type).first
    @follow.destroy
    if @follow.destroy
      redirect_back(fallback_location: feed_path, notice: "You stopped following #{@charity.name}")
    end
  end

  private

  def set_charity
    @charity = Charity.find(params[:id])
  end

  def charity_params
    params.require(:charity).permit(:name, :address, :location, :website, :category, :description, :logo)
  end
end
