FactoryBot.define do
  factory :user, aliases: [:user_josue], class: User do
    name 'Josué Henrique'
    login 'josue'
    token 'asdf1234dgr46gjv'
    active true
  end
end
