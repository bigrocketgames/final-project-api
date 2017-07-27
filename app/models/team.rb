class Team < ApplicationRecord
  belongs_to :sub_sport
  has_many :user_teams
  has_many :fans, through: :user_teams, source: :user

  after_create :addFullName
  validates :name, :mascot, :sub_sport, presence: true
  validate :no_duplicate_team

  def no_duplicate_team
    teamExists = Team.where('name = ? AND mascot = ? AND sub_sport_id = ?', self.name, self.mascot, self.sub_sport).count
    if teamExists > 0
      errors.add(:name, "can't have a duplicate team")
    end
  end

  private

    def addFullName
      fullName = self.name + " " + self.mascot
      self.update(fullName: fullName)
    end
end
