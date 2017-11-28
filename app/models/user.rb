class User < ActiveRecord::Base
  validates :login, :token, presence: true
  validates :login, uniqueness: true

  orderize
  filterize
end
