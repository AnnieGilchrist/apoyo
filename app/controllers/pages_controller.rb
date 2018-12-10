class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def index
    if current_user.organisation.class == Business
      @suggestions = Charity.all.where(category: current_user.organisation.charity_preferences)
    else
      @suggestions = Business.all.where(charity_preferences: current_user.organisation.category)
    end

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
      results = @missions + @charities
      @results = results.shuffle
    else
      @missions = Mission.all
      @charities = Charity.all
      results = @missions + @charities
      @results = results.shuffle
    end
  end
end
