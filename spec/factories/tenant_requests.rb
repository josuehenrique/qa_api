FactoryBot.define do
  factory :tenant_request, class: TenantRequest do
    tenant { FactoryBot.create(:tenant) }
    amount 1
    route '/question'
  end
end
