class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]

  def index
    @missions = policy_scope(Mission)
  end

  def show
    authorize @mission
    @charity = Charity.find(@mission.charity_id)
    @partnership = Partnership.new
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

  def set_mission
    @mission = Mission.find(params[:id])
  end
end
