class CharitiesController < ApplicationController
  before_action :set_charity, only: [:show, :edit, :update, :destroy, :follow, :unfollow]

  def index
    @charities = policy_scope(Charity)
  end

  def show
    authorize @charity
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
    @charity.update(charity_params)
    if @charity.save
      redirect_to charity_path(@charity)
    else
      render :new
    end
  end

  def destroy
    authorize @charity
    @charity.destroy
  end

  def follow
    authorize @charity
    @follow = Follow.new
    @follow.charity = @charity
    @follow.business = current_user.organisation
    if @follow.save
      redirect_to charity_path(@charity), notice: "Now following #{@charity.name}"
    else
      redirect_to charity_path(@charity), notice: "You are already following #{@charity.name}"
    end
  end

  def unfollow
    authorize @charity
    @follow = Follow.where(charity_id: @charity.id, business_id: current_user.organisation.id).first
    if @follow.destroy
      redirect_to charity_path(@charity), notice: "You stopped following #{@charity.name}"
    end
  end

  private

  def set_charity
    @charity = Charity.find(params[:id])
  end

  def charity_params
    params.require(:charity).permit(:name, :address, :website, :category, :description, :logo)
  end
end
