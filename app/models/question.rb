class Question < ApplicationRecord
  belongs_to :asker, class_name: 'User', foreign_key: :asker_id
  has_many :answers

  validates :question, :asker_id, presence: true

  scope :public_questions, -> { where(particular: false) }
end
