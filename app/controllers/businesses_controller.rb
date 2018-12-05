class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  def index
    @businesses = policy_scope(Business)
  end

  def show
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
  end

  def destroy
    authorize @business
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :address, :website, :description, :logo)
  end
end
