class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatRoom

  validates :content, :user_id, :chatRoom_id, presence: true
  validates :content, length: { minimum: 1 }
end
