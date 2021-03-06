class Api::V1::SportsController < ApplicationController

  def index
    @sports = Sport.all

    render json: @sports
  end
  
  def create
    @sport = Sport.new(sport_params)

    if @sport.save
      render json: @sport
    else
      render json: {
        errors: @sport.errors
      }, status: 400
    end
  end

  private

  def sport_params
    params.require(:sport).permit(:sport_name)
  end

end