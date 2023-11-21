class DashboardController < ApplicationController

  def index
    @my_games = current_user.games
  end

end
