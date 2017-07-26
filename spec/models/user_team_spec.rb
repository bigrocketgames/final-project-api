require 'rails_helper'

RSpec.describe UserTeam, type: :model do
  describe 'relationships' do
    it 'belongs to a user' do
      user_team = create(:user_team)

      expect(user_team.user.id).to_not eq(nil)
    end

    it 'belongs to a team' do
      user_team = create(:user_team)

      expect(user_team.team.id).to_not eq(nil)
    end
  end
end
