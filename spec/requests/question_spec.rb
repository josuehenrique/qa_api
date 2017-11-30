require 'rails_helper'

describe Question do
  context '#show' do
    context 'when has question' do
      it 'should return status 200 and json the resource' do
        question = FactoryBot.create(:answer).question

        get question_path(question.id)

        expect(response.code).to eq '200'
        expect(response.body).to eq QuestionJsonFormatter.format(question).to_json
      end
    end

    context 'when has no question' do
      it 'should return status 204 and blank body' do
        get question_path(10)

        expect(response.code).to eq '204'
        expect(response.body).to eq ''
      end
    end
  end

  context '#index' do
    context 'when has questions' do
      it 'should return status 200 and json the collection' do
        user      = FactoryBot.create(:user)

        question1 = FactoryBot.create(
          :question,
          particular: false,
          asker: user,
          question: 'Are you Ok?'
        )

        question2 = FactoryBot.create(
          :question,
          particular: false,
          asker: user,
          question: 'Whats your name?'
        )

        FactoryBot.create(
          :question,
          particular: true,
          asker: user,
          question: 'What the sky\'s color?'
        )

        FactoryBot.create(:answer, question: question1, provider: user)
        FactoryBot.create(:answer, question: question2, answer: 'My name is Joana', provider: user)

        get questions_path

        expect(response.code).to eq '200'
        expect(response.body).to eq QuestionJsonFormatter.format([question1, question2]).to_json
      end
    end

    context 'when has no questions' do
      it 'should return status 204 and blank body' do

        get questions_path

        expect(response.code).to eq '204'
        expect(response.body).to eq ''
      end
    end
  end
end
