class Tenant < ApplicationRecord
  validates :name, :login, :api_token, presence: true
  validates :login, :api_token, uniqueness: true
end
