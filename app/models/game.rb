class Game < ApplicationRecord
  has_one :chat_room
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  validates :game_time, :chat_room_id, :home_team_id, :away_team_id, presence: true
end
