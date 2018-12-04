class MissionsController < ApplicationController
  def index
    @missions = policy_scope(Mission)
  end

  def show
  end

  def new
    authorize @mission
  end

  def create
    authorize @mission
  end

  def edit
    authorize @mission
  end

  def update
    authorize @mission
  end

  def destroy
    authorize @mission
  end
end
