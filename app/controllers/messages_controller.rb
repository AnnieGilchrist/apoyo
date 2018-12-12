class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    @message = Message.new(message_params)
    @message.conversation = @conversation

    if current_user.organisation == @conversation.participant_a
      @direction = "a to b"
      @recipient = @conversation.participant_b
    else
      @direction = "b to a"
      @recipient = @conversation.participant_a
    end

    @message.direction = @direction
    authorize @message

    if @message.save
      redirect_to conversations_path, notice: "message sent to #{@recipient.name}"
      # respond_to do |format|
      #   format.html { redirect_to partnership_path(@partnership) }
      #   format.js  # <-- will render `app/views/reviews/create.js.erb`
      # end
    else
      redirect_to conversations_path, notice: "message could not be sent to #{@recipient.name}"
      # respond_to do |format|
      #   format.html { render 'partnerships/show' }
      #   format.js  # <-- idem
      # end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
