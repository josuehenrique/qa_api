class User < ApplicationRecord
  validates :login, :name, :token, presence: true
  validates :login, :token, uniqueness: true

  filterize
end
