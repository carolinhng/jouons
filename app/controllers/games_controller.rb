class GamesController < ApplicationController
  def index
    @games = Game.all.where(availability: true)
    if params[:query].present?
      @games = @games.search_by_name_and_description(params[:query])
    end
  end

  def show
    @game = Game.find(params[:id])
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

  private

  def game_params
    params.require(:game).permit(:name, :description, :price, :player_number, :games_durantion, :availability, photos:[])
  end

end
