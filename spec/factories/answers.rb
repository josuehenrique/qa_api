FactoryBot.define do
  factory :answer, aliases: [:answer_how_are_you], class: Answer do
    answer 'I am fine, tnks.'
    question { FactoryBot.create(:question, asker: provider) }
    provider { FactoryBot.create(:user) }
  end
end
