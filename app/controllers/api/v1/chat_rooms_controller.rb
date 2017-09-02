class Api::V1::ChatRoomsController < ApplicationController

  def create
    chatRoom = ChatRoom.new(chat_room_params)

    if chatRoom.save
      render json: chatRoom
    else
      render json: {
        errors: chatRoom.errors
      }, status: 400
    end
  end

  def update
    chatRoom = ChatRoom.find(params[:id])

    if chatRoom.update(chat_room_params)
      render json: chatRoom
    else
      render json: {
        errors: chatRoom.errors
      }, status: 400
    end

  private

  def chat_room_params
    params.require(:chat_room).permit(:game_id)
  end
end