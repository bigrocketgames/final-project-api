class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :content, :user_id, :chat_room_id, presence: true
  validates :content, length: { minimum: 1 }
end
