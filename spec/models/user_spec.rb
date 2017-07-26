require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do

    it 'requires an email and password upon creation' do
      user = build(:user, email: nil, password: nil)

      expect(user.valid?).to eq(false)
      expect(user.errors.full_messages).to eq([
        "Password can't be blank",
        "Email can't be blank", 
        "Email is invalid"
      ])
    end

    it 'requires that an email is unique' do
      create(:user)
      user = build(:user)

      expect(user.valid?).to eq(false)
      expect(user.errors.full_messages).to eq([
        "Email has already been taken"
      ])
    end

    it 'requires that an email is valid (contains an @ symbol and a (.com, .org, etc...)' do
      user1 = build(:user, email: "test.com")
      user2 = build(:user, email: "test@test")
      user3 = build(:user, email: "test")

      expect(user1.valid?).to eq(false)
      expect(user2.valid?).to eq(false)
      expect(user3.valid?).to eq(false)
    end

  end

  describe 'on save' do

    it 'hashes a password' do
      user = build(:user)
      user.save

      expect(user.password_digest).not_to eq(user.password)
    end

  end

  describe 'relationships' do

    it 'has many favorite teams' do
      user = create(:user)
      user.favorite_teams.create(name: "wsu", mascot: "cougars", sport_id: 1)
      user.favorite_teams.create(name: "uw", mascot: "huskies", sport_id: 1)

      expect(user.favorite_teams.length).to eq(2)
    end

    it 'has many messages' do
      @user = create(:user)
      @sport = create(:sport)
      @home_team = create(:home_team, sport_id: @sport.id)
      @away_team = create(:away_team, sport_id: @sport.id)
      @game = create(:game, home_team_id: @home_team.id, away_team_id: @away_team.id)
      @chat_room = create(:chat_room, game_id: @game.id)
      message1 = create(:message, user_id: @user.id, chat_room_id: @chat_room.id)
      message2 = create(:message, user_id: @user.id, chat_room_id: @chat_room.id)

      expect(@user.messages.length).to eq(2)
    end

    it 'has many chat rooms through messages' do
      @user = create(:user)
      @sport = create(:sport)
      @home_team = create(:home_team, sport_id: @sport.id)
      @away_team = create(:away_team, sport_id: @sport.id)
      @game = create(:game, home_team_id: @home_team.id, away_team_id: @away_team.id)
      @game2 = create(:game, home_team_id: @away_team.id, away_team_id: @home_team.id)
      @chat_room = create(:chat_room, game_id: @game.id)
      @chat_room2 = create(:chat_room, game_id: @game2.id)
      message1 = create(:message, user_id: @user.id, chat_room_id: @chat_room.id)
      message2 = create(:message, user_id: @user.id, chat_room_id: @chat_room.id)
      message3 = create(:message, user_id: @user.id, chat_room_id: @chat_room2.id)

      expect(@user.chat_rooms.length).to_not eq(0)
    end

  end

end
