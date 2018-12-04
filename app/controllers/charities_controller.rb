class CharitiesController < ApplicationController
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
end
