class CharitiesController < ApplicationController
  before_action :set_charity, only: [:show, :edit, :update, :destroy]

  def index
    @charities = policy_scope(Charity)
  end

  def show
  end

  def new
    authorize @charity
  end

  def create
    authorize @charity
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
end
