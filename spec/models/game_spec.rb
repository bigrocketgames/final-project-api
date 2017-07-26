require 'rails_helper'

RSpec.describe Game, type: :model do
  before(:each) do
    @sport = create(:sport)
    @home_team = create(:home_team, sport_id: @sport.id)
    @away_team = create(:away_team, sport_id: @sport.id)
    @game = create(:game, home_team_id: @home_team.id, away_team_id: @away_team.id)
    @game1 = build(:game, home_team_id: nil, away_team_id: nil, game_time: nil)
  end

  describe 'validations' do
    it 'requires game_time, home_team_id, and away_team_id' do

      expect(@game.valid?).to eq(true)
      expect(@game1.valid?).to eq(false)
      expect(@game1.errors.full_messages).to eq([
        "Home team must exist", 
        "Away team must exist", 
        "Game time can't be blank", 
        "Home team can't be blank", 
        "Away team can't be blank"
      ])
    end
  end

  describe 'relationships' do
    it 'has one chat room' do
      chat_room = create(:chat_room, game_id: @game.id)

      expect(@game.chat_room.id).to eq(chat_room.id)
    end

    it 'belongs to home team' do
      expect(@game.home_team.id).to_not eq(nil)
    end

    it 'belongs to away team' do
      expect(@game.away_team.id).to_not eq(nil)
    end
  end
end
