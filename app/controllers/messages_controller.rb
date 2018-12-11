class MessagesController < ApplicationController
  before_action :set_partnership, only: [:create]

  # def inbox
  #   @conversations = Message.where()
  # end

  def create
    @message = Message.new(message_params)
    @message.partnership = @partnership
    chatters = []
    me =[]
    me << current_user.organisation
    chatters << @partnership.business
    chatters << @partnership.mission.charity
    partner = (chatters - me).first
    @message.sender = current_user.organisation
    @message.recipient = partner
    authorize @message

    if @message.save
      respond_to do |format|
        format.html { redirect_to partnership_path(@partnership) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'partnerships/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def set_partnership
    @partnership = Partnership.find(params[:partnership_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
