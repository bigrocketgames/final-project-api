require 'rails_helper'

RSpec.describe Sport, type: :model do
  
  describe 'validations' do
    it 'Requires a sport name' do
      sport = build(:sport, sport_name: nil)

      expect(sport.valid?).to eq(false)
    end
    
  end

  describe 'relationships' do
    it 'has many teams' do
      sport = create(:sport)
      sport.teams.create(team_name: "wsu", mascot: "cougars")
      sport.teams.create(team_name: "uw", mascot: "huskies")

      expect(sport.teams.length).to eq(2)
    end
  end
  
end
