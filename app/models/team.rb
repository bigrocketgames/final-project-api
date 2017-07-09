class Team < ApplicationRecord
  belongs_to :sport

  validates :name, :mascot, :sport, presence: true
end
