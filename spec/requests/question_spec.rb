require 'rails_helper'

describe Question do
  context '#show' do
    context 'when has question' do
      it 'should return status 200 and json the resource' do
       question = FactoryBot.create(:question)

        get question_path(question.id)

        expect(response.code).to eq '200'
        expect(response.body).to eq question.to_json
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
          question: 'Are you fine?'
        )

        question4 = FactoryBot.create(
          :question,
          particular: false,
          asker: user,
          question: 'What the sky\'s color?'
        )

        get questions_path

        expect(response.code).to eq '200'
        expect(response.body).to eq [question1, question2, question4].to_json
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
