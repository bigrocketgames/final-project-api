require 'rails_helper'

RSpec.describe Message, type: :model do

  before(:each) do
    @user = create(:user)
    @sport = create(:sport)
    @home_team = create(:home_team, sport_id: @sport.id)
    @away_team = create(:away_team, sport_id: @sport.id)
    @game = create(:game, home_team_id: @home_team.id, away_team_id: @away_team.id)
    @chat_room = create(:chat_room, game_id: @game.id)
  end

  describe 'validations' do
    it 'requires content, user_id, and chatRoom_id on creation' do
      message = build(:message, user_id: @user.id, chat_room_id: @chat_room.id)
      message1 = build(:message, user_id: nil, chat_room_id: nil)

      expect(message.valid?).to eq(true)
      expect(message1.valid?).to eq(false)
      expect(message1.errors.full_messages).to eq([
        "User must exist", 
        "Chat room must exist", 
        "User can't be blank", 
        "Chat room can't be blank"
      ])
    end

    it 'requires the content to be at least 1 character in length' do
      message = build(:message, content: nil, user_id: @user.id, chat_room_id: @chat_room.id)

      expect(message.valid?).to eq(false)
      expect(message.errors.full_messages).to eq([
        "Content can't be blank",
        "Content is too short (minimum is 1 character)"
      ])
    end
    
  end

  describe 'relationships' do
    it 'belongs_to a user' do
      message = build(:message, content: nil, user_id: @user.id, chat_room_id: @chat_room.id)

      expect(message.user).to_not eq(nil)
    end

    it 'belongs_to a chatRoom' do
      message = build(:message, content: nil, user_id: @user.id, chat_room_id: @chat_room.id)

      expect(message.chat_room).to_not eq(nil)
    end

  end
end
