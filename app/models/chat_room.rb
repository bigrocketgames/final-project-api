class ChatRoom < ApplicationRecord
  belongs_to :game
  has_many :messages
  has_many :users, through: :messages

  validates :game_id, presence: true
end
