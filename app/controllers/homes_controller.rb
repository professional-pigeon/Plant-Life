class HomesController < ApplicationController

  def index
    @user = User.all.first
    @plants = @plants = @user.plants
  end

  def test
    respond_to do |format|
      format.html
      format.js
    @user = User.all.first
    @plants = @plants = @user.plants
    end
  end
end