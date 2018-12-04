class PartnershipsController < ApplicationController
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
end
