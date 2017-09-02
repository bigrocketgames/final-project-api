class Api::V1::TeamsController < ApplicationController

  def index
    @teams = Team.all
    render json: @teams
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      render json: @team
    else
      render json: {
        errors: @team.errors
      }, status: 400
    end
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      render json: @team
    else
      render json: {
        errors: @team.errors
      }, status: 400
    end
  end

  private
    
  def team_params
    params.require(:team).permit(:name, :mascot, :sub_sport_id, :home_location, :fullName)
  end

end