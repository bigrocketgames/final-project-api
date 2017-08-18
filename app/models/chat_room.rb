class ChatRoom < ApplicationRecord
  belongs_to :game
  has_many :messages
  has_many :users, through: :messages

  after_create :add_name
  validates :game_id, uniqueness: true, presence: true

  private

  def add_name
    gameDay = self.game.game_time.strftime(" %A %m/%d/%Y")
    roomName = self.game.away_team.name + " " + self.game.away_team.mascot + " @ " + self.game.home_team.name + " " + self.game.home_team.mascot + gameDay

    # roomName = self.game.away_team.fullName + " @ " + self.game.home_team.fullName + gameDay

    self.update(name: roomName)
  end
end
