require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  before(:each) do
    @sport = create(:sport)
    @home_team = create(:home_team, sport_id: @sport.id)
    @away_team = create(:away_team, sport_id: @sport.id)
    @game = create(:game, home_team_id: @home_team.id, away_team_id: @away_team.id)
  end

  describe 'validations' do
    it 'requires a game_id' do
      chat_room = build(:chat_room, game_id: nil)

      expect(chat_room.valid?).to eq(false)
      expect(chat_room.errors.full_messages).to eq([
        "Game must exist", 
        "Game can't be blank"
      ])
    end

    it 'requires game_id to be unique' do
      chat_room = create(:chat_room, game_id: @game.id)
      chat_room1 = build(:chat_room, game_id: @game.id)

      expect(chat_room.valid?).to eq(true)
      expect(chat_room1.valid?).to eq(false)
      expect(chat_room1.errors.full_messages).to eq([
        "Game has already been taken"
      ])
    end
  end
  
  describe 'relationships' do

  end
  
end
