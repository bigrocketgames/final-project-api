class SubSport < ApplicationRecord
  belongs_to :sport
  has_many :teams

  validates :name, :conference_split, :sport_id, presence: true
  validates :name, uniqueness: true
end
