class BusinessesController < ApplicationController
  def index
    @businesses = policy_scope(Business)
  end

  def show
  end

  def new
    authorize @business
  end

  def create
    authorize @business
  end

  def edit
    authorize @business
  end

  def update
    authorize @business
  end

  def destroy
    authorize @business
  end
end
