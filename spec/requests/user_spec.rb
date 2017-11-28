require 'rails_helper'

describe 'Public access to users' do
  context '#show' do
    context 'when has user' do
      it 'should return status 200 and json the resource' do
       user = FactoryBot.create(:user_josue)

        get user_path(user.id)

        expect(response.code).to eq '200'
        expect(response.body).to eq user.to_json
      end
    end

    context 'when has no user' do
      it 'should return status 204 and blank body' do
        get user_path(10)

        expect(response.code).to eq '204'
        expect(response.body).to eq ''
      end
    end
  end

  context '#index' do
    context 'when has users' do
      it 'should return status 200 and json the collection' do
        user1 = FactoryBot.create(:user, login: 'josue')
        user2 = FactoryBot.create(:user, login: 'isaiah')
        user3 = FactoryBot.create(:user, login: 'mariah')
        user4 = FactoryBot.create(:user, login: 'jeremiah')

        get users_path

        expect(response.code).to eq '200'
        expect(response.body).to eq [user1, user2, user3, user4].to_json
      end
    end

    context 'when has no users' do
      it 'should return status 204 and blank body' do

        get users_path

        expect(response.code).to eq '204'
        expect(response.body).to eq ''
      end
    end
  end
end
