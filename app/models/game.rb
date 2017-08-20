class Game < ApplicationRecord
  has_one :chat_room
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  after_create :createChatRoom, :addGameLocation
  validates :game_time, :home_team_id, :away_team_id, presence: true
  validate :no_duplicate_game

  def no_duplicate_game

    gameExists = Game.where('home_team_id = ? AND away_team_id = ? AND game_time = ?', self.home_team_id, self.away_team_id, self.game_time)

    # binding.pry

    if gameExists.count > 0
      errors.add(:id, "Can't create duplicate games.")
    end
  end

  private

  def createChatRoom
    chatRoom = self.create_chat_room(game_id: self.id)
    self.update(chat_room_id: chatRoom.id)
  end

  def addGameLocation
    self.location = self.home_team.home_location if self.location.nil?
  end

end
