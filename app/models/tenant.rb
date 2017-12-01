class Tenant < ApplicationRecord
  validates :name, :login, :api_key, presence: true
  validates :login, :api_key, uniqueness: true
end
