class GamesController < ApplicationController

  def index
    # @games = Game.where(availability: true)
    @games = User.near(current_user.address, 10).map { |user| user.games.select(&:availability) }.flatten
    @users = @games.map(&:user).uniq
    if params[:query].present?
      @games = Game.where(id: @games)
      @games = @games.search_by_name_and_description(params[:query])
      @users = @games.map(&:user).uniq
    end
    @markers = @users.map do |user|
      {
        lat: user.geocode[0],
        lng: user.geocode[1],
        info_window_html: render_to_string(partial: "infos_card_map_games",
        locals: { user: user, games: user.games }),
        marker_html: render_to_string(partial: "marker_map_game")
      }
    end
  end

  def show
    @game = Game.find(params[:id])
    @user = @game.user
    # The `geocoded` scope filters only flats with coordinates
    @markers = [
      { lat: @user.geocode[0],
        lng: @user.geocode[1],
        info_window_html: render_to_string(partial: "infos_card_map_game",
        locals: { user: @user, game: @game }),
        marker_html: render_to_string(partial: "marker_map_game") },
      { lat: current_user.geocode[0],
        lng: current_user.geocode[1],
        info_window_html: render_to_string(partial: "infos_card_map_current_user",
        locals: { current_user: current_user }),
        marker_html: render_to_string(partial: "marker_map_user") }
    ]
    @rent = Rent.new

    # @total_day = duration_rent(@rent.start_date, @rent.end_date)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to dashboard_index_path, status: :see_other
  end

  def update_localisation
    current_user.address = params[:user][:address]
    current_user.save
    redirect_to games_path
  end

  def toggle_availability
    @game = Game.find(params[:id])
    @game.update(availability: !@game.availability)
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :price, :player_number, :games_duration, :availability, photos:[])
  end

  # def duration_rent(start_date, end_date)
  #   end_date - start_date
  # end

end
