class CharitiesController < ApplicationController
  before_action :set_charity, only: [:show, :edit, :update, :destroy]

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
  end

  def destroy
    authorize @charity
  end

  private

  def set_charity
    @charity = Charity.find(params[:id])
  end

  def charity_params
    params.require(:charity).permit(:name, :address, :website, :category, :description, :logo)
  end
end
