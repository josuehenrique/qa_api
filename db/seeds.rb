# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(login: 'josue', token: '12asdf341asdf243', name: 'Peter')
user2 = User.create(login: 'josuehenrique', token: '124312431243asdf', name: 'Andrew C.')
user3 = User.create(login: 'josuehenriqueferreira', token: '3456345asdf6345', name: 'Kevin')
user4 = User.create(login: 'lucas', token: '56785asd67856asdf78', name: 'Callue')
user5 = User.create(login: 'lucashenrique', token: '12431qwer2ghjk3434k56568', name: 'Porter')

question1 = Question.create(particular: true, asker: user1, question: 'Where are you from?')
question2 = Question.create(particular: false, asker: user2, question: 'Are you Ok?')
question3 = Question.create(particular: false, asker: user3, question: 'Whats your name?')
question4 = Question.create(particular: false, asker: user4, question: 'Whats your problem?')
question5 = Question.create(particular: false, asker: user5, question: 'What the sky\'s color?')

Answer.create(question: question1, provider: user5, answer: 'I am from Canada.')
Answer.create(question: question1, provider: user4, answer: 'I am from USA.')
Answer.create(question: question1, provider: user3, answer: 'I am from Brazil.')
Answer.create(question: question1, provider: user2, answer: 'I am from Canada.')
Answer.create(question: question1, provider: user1, answer: 'I am from Portugal.')

Answer.create(question: question2, provider: user1, answer: 'I am fine.')
Answer.create(question: question2, provider: user2, answer: 'I am so sad.')
Answer.create(question: question2, provider: user3, answer: 'I am sick')
Answer.create(question: question2, provider: user4, answer: 'Yes, I am Ok ')
Answer.create(question: question2, provider: user5, answer: 'No, I am not Ok')

Answer.create(question: question3, provider: user5, answer: 'My name is Joshua')
Answer.create(question: question3, provider: user4, answer: 'My name is Moses')
Answer.create(question: question3, provider: user3, answer: 'My name is Kelly')
Answer.create(question: question3, provider: user2, answer: 'My name is Peter')
Answer.create(question: question3, provider: user1, answer: 'My name is Noah')

Answer.create(question: question4, provider: user1, answer: 'I have no problem')
Answer.create(question: question4, provider: user2, answer: 'My friend died')
Answer.create(question: question4, provider: user3, answer: 'My wife left me')
Answer.create(question: question4, provider: user4, answer: 'My brother owes me money')
Answer.create(question: question4, provider: user5, answer: 'I spent all my money')

Answer.create(question: question5, provider: user5, answer: 'I think the sky is blue')
Answer.create(question: question5, provider: user4, answer: 'Blue on de morning and red at sunset')
Answer.create(question: question5, provider: user3, answer: 'Black in the night')
Answer.create(question: question5, provider: user2, answer: 'The sky have many colors.')
Answer.create(question: question5, provider: user1, answer: 'Grey in my country')

Tenant.create(name: 'Grey', login: 'grey', api_token: 'asdf342dsadf')
Tenant.create(name: 'Melly', login: 'melly', api_token: 'asdf342234dss$adf')
