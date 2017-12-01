require 'rails_helper'

describe Tenant do
  context 'when try to duplicate user login' do
    it 'should not save' do
      FactoryBot.create(:tenant)
      tenant = FactoryBot.build(:tenant)

      tenant.save

      expect(tenant.errors[:login]).to include 'has already been taken'
    end
  end

  context 'when try to duplicate user token' do
    it 'should not save' do
      FactoryBot.create(:tenant)
      tenant = FactoryBot.build(:tenant)

      tenant.save

      expect(tenant.errors[:api_key]).to include 'has already been taken'
    end
  end
end
