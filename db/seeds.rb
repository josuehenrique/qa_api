# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(login: 'josue', token: '12asdf341asdf243')
user2 = User.create(login: 'josuehenrique', token: '124312431243asdf')
user3 = User.create(login: 'josuehenriqueferreira', token: '3456345asdf6345')
user4 = User.create(login: 'lucas', token: '56785asd67856asdf78')
user5 = User.create(login: 'lucashenrique', token: '12431qwer2ghjk3434k56568')

Question.create(particular: true, asker: user1, question: 'Where are you from?')
Question.create(particular: false, asker: user2, question: 'Are you Ok?')
Question.create(particular: false, asker: user3, question: 'Whats your name?')
Question.create(particular: false, asker: user4, question: 'Are you fine?')
Question.create(particular: false, asker: user5, question: 'What the sky\'s color?')
