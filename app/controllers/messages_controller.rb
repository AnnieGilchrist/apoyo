class MessagesController < ApplicationController
  before_action :set_partnership, only: [:index, :new, :create]

  # def inbox
  #   @conversations = Message.where()
  # end

  def index
    @messages = Message.where(partnership_id: @partnership.id)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
  end

  private

  def set_partnership
    @partnership = Partnership.find(params[:partnership_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end


end
