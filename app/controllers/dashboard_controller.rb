class DashboardController < ApplicationController
  def index
    @my_games = current_user.games
    @my_rents = current_user.rents
    @rent = Rent.new
    @my_query_rents = Rent.where(game_id: @my_games)
  end

end
