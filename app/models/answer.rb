class Answer < ApplicationRecord
  belongs_to :provider, class_name: 'User', foreign_key: :provider_id
  belongs_to :question

  validates :answer, :provider_id, presence: true
end
