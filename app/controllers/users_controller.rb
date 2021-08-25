class UsersController < ApplicationController

  def profile
    @user = current_user
    @messages = current_user.messages
    @message = current_user.sent_messages.new
    @users = User.all
    render :profile
  end

  def create
    @user = User.last
    if @user.save
      UserMailer.welcome_email(@user).deliver
    end
  end

  def show 
    @message = current_user.sent_messages.new
    @messages = current_user.messages
    @user = User.find(params[:id])
    @sender = current_user
  end
  
end