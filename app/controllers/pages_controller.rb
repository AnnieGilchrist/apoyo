class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def index
    @charities = Charity.all

    sql_query_charity = "\
      charities.name @@ :query \
      OR charities.address @@ :query \
      OR charities.description @@ :query \
      OR charities.category @@ :query \
      "

    sql_query_mission = "\
      missions.name @@ :query \
      OR missions.description @@ :query \
      "

    if params[:query].present?
      @charities = Charity.where(sql_query_charity, query: "%#{params[:query]}%")
      @missions = Mission.where(sql_query_mission, query: "%#{params[:query]}%")
      @results = @missions.shuffle + @charities.shuffle
    else
      @missions = Mission.all
      @charities = Charity.all
      @results = @missions.shuffle + @charities.shuffle
    end
  end
end
