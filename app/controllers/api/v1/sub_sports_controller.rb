class Api::V1::SubSportsController < ApplicationController

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
    
    if @subSport
      @subSport.destroy
    else
      render json: {
        errors: "No such sub sport exists"
      }, status: 400
    end
  end

  private

  def subSport_params
    params.require(:sub_sport).permit(:name, :conference_split, :sport_id)
  end

end