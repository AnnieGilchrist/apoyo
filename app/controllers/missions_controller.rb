class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]

  def index
    @missions = policy_scope(Mission)
  end

  def show
    authorize @mission
    @charity = Charity.find(@mission.charity_id)
    @partnership = Partnership.new
    if !@mission.longitude.nil? && !@mission.latitude.nil?
      @marker = {
        lng: @mission.longitude,
        lat: @mission.latitude,
        infoWindow: { content: render_to_string(partial: "/missions/map_window", locals: { mission: @mission }) }
      }
    elsif !@charity.longitude.nil? && !@charity.latitude.nil?
      @marker = {
        lng: @charity.longitude,
        lat: @charity.latitude,
        infoWindow: { content: render_to_string(partial: "/charities/map_window", locals: { charity: @charity }) }
      }
    end
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
    @mission.update(mission_params)
    if @mission.save
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  def destroy
    authorize @mission
    @charity = @mission.charity
    @mission.destroy
    redirect_to charity_path(@charity)
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(:name, :description, :image, :duration, :address)
  end
end
