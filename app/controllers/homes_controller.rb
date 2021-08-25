class HomesController < ApplicationController

  def index
    @user = User.all.first
    @plants = @plants = @user.plants
  end

  def test
    @user = User.all.first
    @plants = @plants = @user.plants
  end
end