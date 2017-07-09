require 'rails_helper'

RSpec.describe Sport, type: :model do
  
  describe 'validations' do
    it 'Requires a sport name' do
      sport = build(:sport, sport_name: nil)

      expect(sport.valid?).to eq(false)
    end

    it 'requires that each sport name be unique' do
      sport = create(:sport)
      sport1 = build(:sport)

      expect(sport1.valid?).to eq(false)
      expect(sport1.errors.full_messages).to eq([
        "Sport name has already been taken"
      ])
    end
    
  end

  describe 'relationships' do
    it 'has many teams' do
      sport = create(:sport)
      sport.teams.create(name: "wsu", mascot: "cougars")
      sport.teams.create(name: "uw", mascot: "huskies")

      expect(sport.teams.length).to eq(2)
    end
  end
  
end
