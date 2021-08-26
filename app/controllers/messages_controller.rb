class MessagesController < ApplicationController
  before_action :set_recipient, only: [:new, :create]

  def new
   @message = current_user.sent_messages.new
   @user = @recipient
  end

  def create
     @message = current_user.sent_messages.new message_params
     @message.recipient_id = @recipient.id
     @message.save
     redirect_to  "/users/#{@message.recipient_id}"
  end

  def index
     @messages = current_user.messages
  end

  def destroy
     @message = current_user.messages.destroy params[:id]
  end

  def show
     @message = current_user.messages.find params[:id]
  end

  private

  def message_params
     params.require(:message).permit(:content, :recipient_id, :sender_id)
  end

  def set_recipient
   @recipient = User.find params[:user_id]
  end
end