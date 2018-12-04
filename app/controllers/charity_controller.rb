class CharityController < ApplicationController
  def new
    @charity = Charity.new
    authorize @charity
  end
end
