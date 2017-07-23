class ChatRoomIdToChatRoomId < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :chatRoom_id, :chat_room_id
  end
end