require 'rails_helper'

describe 'Public access to users' do
  context '#show' do
    context 'when has user' do
      it 'should return status 200 and json the resource' do
       user = FactoryBot.create(:user_josue)
       tenant = FactoryBot.create(:tenant)

        get user_path(user.id), headers: { 'HTTP_API_KEY' => tenant.api_key }

        expect(response.code).to eq '200'
        expect(response.body).to eq user.to_json
      end
    end

    context 'when has no user' do
      it 'should return status 204 and blank body' do
        tenant = FactoryBot.create(:tenant)

        get user_path(10), headers: { 'HTTP_API_KEY' => tenant.api_key }

        expect(response.code).to eq '204'
        expect(response.body).to eq ''
      end
    end
  end

  context '#index' do
    context 'when has users' do
      it 'should return status 200 and json the collection' do
        user1 = FactoryBot.create(:user, login: 'josue', token: 'asdf234dg23vc')
        user2 = FactoryBot.create(:user, login: 'isaiah', token: 'asdf234dgvcd')
        user3 = FactoryBot.create(:user, login: 'mariah', token: 'asdf234dgvdwc')
        user4 = FactoryBot.create(:user, login: 'jeremiah', token: 'asdf234dgvxc')
        tenant = FactoryBot.create(:tenant)

        get users_path, headers: { 'HTTP_API_KEY' => tenant.api_key }

        expect(response.code).to eq '200'
        expect(response.body).to eq [user1, user2, user3, user4].to_json
      end
    end

    context 'when has no users' do
      it 'should return status 204 and blank body' do
        tenant = FactoryBot.create(:tenant)

        get users_path, headers: { 'HTTP_API_KEY' => tenant.api_key }

        expect(response.code).to eq '204'
        expect(response.body).to eq ''
      end
    end
  end
end
