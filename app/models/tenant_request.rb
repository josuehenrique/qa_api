class TenantRequest < ApplicationRecord
  belongs_to :tenant

  validates :tenant_id, :amount, :route, presence: true
  validates :tenant_id, :created_at, :route,
    uniqueness: { scope: [:tenant_id, :created_at, :route] }

  scope :by_route, -> route { where(route: route) }
  scope :by_tenant, -> tenant_id { where(tenant_id: tenant_id) }

  scope :created_today, -> do
    where(created_at: [Time.current.beginning_of_day..Time.zone.now.end_of_day])
  end
end
