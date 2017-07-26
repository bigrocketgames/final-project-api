class Game < ApplicationRecord
  has_one :chat_room
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  after_create :createChatRoom

  validates :game_time, :home_team_id, :away_team_id, presence: true

  private

  def createChatRoom
    self.create_chat_room(game_id: self.id)
  end

end
