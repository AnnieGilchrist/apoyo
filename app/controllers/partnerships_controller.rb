class PartnershipsController < ApplicationController
  before_action :set_partnership, only: [:show, :edit, :update, :destroy]

  def index
    @partnerships = policy_scope(Partnership)
  end

  def show
  end

  def new
    authorize @partnership
  end

  def create
    authorize @partnership
  end

  def edit
    authorize @partnership
  end

  def update
    authorize @partnership
  end

  def destroy
    authorize @partnership
  end

  private

  def set_partnership
    @partnership = Partnership.find(params[:id])
  end
end
