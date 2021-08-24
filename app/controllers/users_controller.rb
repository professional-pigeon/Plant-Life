class UsersController < ApplicationController

  def create
    @user = User.last
    if @user.save
      UserMailer.welcome_email(@user).deliver
    end
  end
end