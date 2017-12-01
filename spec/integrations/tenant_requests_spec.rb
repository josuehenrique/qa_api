require 'rails_helper'

describe TenantRequest do
  context 'when try to duplicate user tenant request' do
    it 'should not save' do
      tenant_request = FactoryBot.create(:tenant_request)
      tenant_request = FactoryBot.build(:tenant_request, tenant: tenant_request.tenant)

      tenant_request.save

      expect(tenant_request.errors[:tenant_id]).to include 'has already been taken'
      expect(tenant_request.errors[:route]).to include 'has already been taken'
      expect(tenant_request.errors[:created_at]).to include 'has already been taken'
    end
  end
end
