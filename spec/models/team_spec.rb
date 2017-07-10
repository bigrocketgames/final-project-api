require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validations' do
    it 'requires a name, mascot, and sport upon creation' do
      team = build(:team, name: nil, mascot: nil, sport: nil)

      expect(team.valid?).to eq(false)
      expect(team.errors.full_messages).to eq([
        "Sport must exist",
        "Sport can't be blank",
        "Name can't be blank",
        "Mascot can't be blank"
      ])
    end
    
  end
  
  describe 'relationships' do
    it 'belongs to a sport' do
      team = build(:team)

      expect(team.sport).to_not eq(nil)
    end

    it 'has many fans through favorite teams'
  end
  
end
