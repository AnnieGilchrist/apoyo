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
    @mission = Mission.new
    @charity = Charity.find(params[:charity_id])
    # We link the object here so that we can authorize the mission using pundit
    # So that we can check if the chairty coming from the URL is the same as the charity of the logged in user.
    @mission.charity = @charity
    authorize @mission
  end

  def create
    @mission = Mission.new(mission_params)
    @charity = Charity.find(params[:charity_id])
    @mission.charity = @charity
    authorize @mission
    if @mission.save
      redirect_to charity_path(@charity), notice: 'Mission successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @mission
    @charity = @mission.charity
  end

  def update
    authorize @mission
  end

  def destroy
    authorize @mission
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(:name, :description, :image, :duration)
  end
end
