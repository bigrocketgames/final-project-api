class Sport < ApplicationRecord
  has_many :sub_sports, dependent: :destroy
  
  validates :sport_name, presence: true, uniqueness: true
end
