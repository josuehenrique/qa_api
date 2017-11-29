FactoryBot.define do
  factory :question, aliases: [:question_how_are_you], class: Question do
    question 'How are you?'
    particular false
    asker { FactoryBot.create(:user) }
  end
end
