class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :content, :user_id, :chatRoom_id, presence: true
  validates :content, length: { minimum: 1 }
end
