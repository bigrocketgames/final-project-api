class Api::V1::GamesController < ApplicationController

  def create
    game = Game.new(game_params)

    if Game.save
      render json: game
    else
      render json: {
        errors: game.errors
      }, status: 400
    end
  end

  def update
    game = Game.find(params[:id])

    if game.update(game_params)
      render json: game
    else
      render json: {
        errors: game.errors
      }, status: 400
    end
  end

  private

  def game_params
    params.require(:game).permit(:game_time, :home_team_id, :away_team_id)
  end

end