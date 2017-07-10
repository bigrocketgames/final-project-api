require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    it 'requires content, user_id, and chatRoom_id on creation' do
      message = build(:message)
      message1 = build(:message, user_id: nil, chatRoom_id: nil)

      expect(message.valid?).to eq(true)
      expect(message1.valid?).to eq(false)
      expect(message1.errors.full_messages).to eq([
        "User can't be blank",
        "ChatRoom can't be blank"
      ])
    end

    it 'requires the content to be at least 1 character in length' do
      message = build(:message, content: nil)

      expect(message.valid?).to eq(false)
      expect(message.errors.full_messages).to eq([
        "Content is too short (minimum is 1 character)"
      ])
    end
    
  end

  describe 'relationships' do
    it 'belongs_to a user' 

    it 'belongs_to a chatRoom'
    
  end
end
