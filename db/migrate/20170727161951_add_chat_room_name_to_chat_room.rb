class AddChatRoomNameToChatRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :name, :string
  end
end
