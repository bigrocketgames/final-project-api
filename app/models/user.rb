class User < ApplicationRecord
  has_secure_password
  has_many :user_teams
  has_many :favorite_teams, through: :user_teams, source: :team
  
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
