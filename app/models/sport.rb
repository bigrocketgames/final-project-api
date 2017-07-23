class Sport < ApplicationRecord
  has_many :teams, dependent: :destroy
  
  validates :sport_name, presence: true, uniqueness: true
end
