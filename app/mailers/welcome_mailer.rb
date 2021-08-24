class WelcomeMailer < ApplicationMailer
  def welcome_send(user)
    @user = user
  end
end