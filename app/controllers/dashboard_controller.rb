class DashboardController < ApplicationController

  def index
    @my_games = current_user.games
    @my_rents = current_user.rents
  end

end
