FactoryBot.define do
  factory :user, aliases: [:user_josue], class: User do
    login 'josue'
    token 'asdf1234dgr46gjv'
    active true
  end
end
