class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

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
      redirect_to business_path(@business)
    else
      render :new
    end
  end

  def destroy
    authorize @business
    @business.destroy
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :address, :website, :description, :logo)
  end
end
