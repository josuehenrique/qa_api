require 'rails_helper'

describe User do
  context 'when try to duplicate user login' do
    it 'should not save' do
      FactoryBot.create(:user_josue)

      user = FactoryBot.build(:user_josue)
      user.save

      expect(user.errors[:login]).to include 'has already been taken'
    end
  end
end
