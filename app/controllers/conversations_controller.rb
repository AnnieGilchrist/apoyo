class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show]

  def index
    @conversations = policy_scope(Conversation)
    Conversation.joins(:messages).order("messages.created_at desc").uniq
  end

  def show
    authorize @conversation
    @message = Message.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.participant_a = current_user.organisation
    authorize @conversation
    if @conversation.save
      redirect_to conversations_path, notice: 'Conversation created'
    else
      redirect_to conversations_path, notice: 'Conversation could not be created'
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:participant_b_id, :participant_b_type, :partnership_id)
  end
end
