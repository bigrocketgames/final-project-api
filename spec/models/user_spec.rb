require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do

    it 'requires an email and password upon creation' do
      user = build(:user, email: nil, password: nil)

      expect(user.valid?).to eq(false)
      expect(user.errors.full_messages).to eq([
        "Password can't be blank",
        "Email can't be blank"
      ])
    end

    it 'requires that an email is unique'

    it 'requires that an email is valid (contains an @ symbol and a (.com, .org, etc...)'

  end

  describe 'on save' do

    it 'hashes a password'

  end

  describe 'relationships' do

    it 'has many favorite teams'

    it 'has many friends'

    it 'has many messages'

  end

end
