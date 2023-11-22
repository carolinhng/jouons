class RentsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    @game = Game.find(params[:game_id])
    @user = current_user
    @rent.game = @game
    @rent.user = @user
    if @rent.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:end_date, :start_date)
  end

end
