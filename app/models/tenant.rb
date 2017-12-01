class Tenant < ApplicationRecord
  has_many :tenant_requests

  validates :name, :login, :api_key, presence: true
  validates :login, :api_key, uniqueness: true
end
