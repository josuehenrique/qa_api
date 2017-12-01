require 'rails_helper'

describe Question do
  context '#show' do
    context 'when has question' do
      it 'should return status 200 and json the resource' do
        question = FactoryBot.create(:answer).question
        tenant = FactoryBot.create(:tenant)

        get question_path(question.id), headers: { 'HTTP_API_KEY' => tenant.api_key }

        expect(response.code).to eq '200'
        expect(response.body).to eq QuestionJsonFormatter.format(question).to_json
      end
    end

    context 'when has no question' do
      it 'should return status 204 and blank body' do
        tenant = FactoryBot.create(:tenant)

        get question_path(10), headers: { 'HTTP_API_KEY' => tenant.api_key }

        expect(response.code).to eq '204'
        expect(response.body).to eq ''
      end
    end
  end

  context '#index' do
    context 'when has questions' do
      context 'and api key is wrong' do
        it 'should returns 412 HTTP response' do
          get question_path(10), headers: { 'HTTP_API_KEY' => '' }

          expect(response.code).to eq '412'
          expect(response.body).to eq(
            { message: I18n.t('controllers.application_controller.tenant_not_registered') }.to_json
          )

        end
      end

      it 'should return status 200 and json the collection and save tenant_request' do
        user   = FactoryBot.create(:user)
        tenant = FactoryBot.create(:tenant)

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

        get questions_path, headers: { 'HTTP_API_KEY' => tenant.api_key }

        expect(response.code).to eq '200'
        expect(response.body).to eq QuestionJsonFormatter.format([question1, question2]).to_json

        expect(TenantRequest.first.route).to eq '/questions'
        expect(TenantRequest.first.amount).to eq 1
      end
    end

    context 'when has no questions' do
      it 'should return status 204 and blank body' do
        tenant = FactoryBot.create(:tenant)

        get questions_path, headers: { 'HTTP_API_KEY' => tenant.api_key }

        expect(response.code).to eq '204'
        expect(response.body).to eq ''
      end
    end
  end
end
