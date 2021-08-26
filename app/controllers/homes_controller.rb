class HomesController < ApplicationController

  def index
    @best = User.best_users.slice(0, 5)
    @worst = User.worst_users.slice(0, 5)
    @healthy = User.healthiest
  end

end