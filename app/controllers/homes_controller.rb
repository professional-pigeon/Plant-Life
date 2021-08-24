class HomesController < ApplicationController

  def index
    @user = User.all.first
    @plants = @plants = @user.plants
  end
end