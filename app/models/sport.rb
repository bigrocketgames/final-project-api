class Sport < ApplicationRecord
  has_many :teams
  validates :sport_name, presence: true, uniqueness: true
end
