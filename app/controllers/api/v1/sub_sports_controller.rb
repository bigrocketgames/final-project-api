class Api::V1::SubSportsController < ApplicationController

  def index
    @subSports = SubSport.all

    render json: @subSports
  end

  def create
    @subSport = SubSport.new(subSport_params)

    if @subSport.save
      render json: {
        sub_sport: @subSport
      }
    else
      render json: {
        errors: @subSport.errors
      }, status: 400
    end
  end

  def destroy
    @subSport = SubSport.find(params[:id])
    
    @subSport.destroy if @subSport
  end

  private

  def subSport_params
    params.require(:sub_sport).permit(:name, :conference_split, :sport_id)
  end

end