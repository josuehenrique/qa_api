class User < ApplicationRecord
  validates :login, :token, presence: true
  validates :login, uniqueness: true

  filterize
end
