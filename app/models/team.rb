class Team < ApplicationRecord
  belongs_to :sport
  has_many :user_teams
  has_many :fans, through: :user_teams, source: :user

  validates :name, :mascot, :sport, presence: true
  validate :no_duplicate_team

  def no_duplicate_team
    teamExists = Team.where('name = ? AND mascot = ? AND sport_id = ?', self.name, self.mascot, self.sport).count
    if teamExists > 0
      errors.add(:name, "can't have a duplicate team")
    end
  end
end
