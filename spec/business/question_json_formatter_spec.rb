require 'spec_helper'
require 'app/business/question_json_formatter'

describe QuestionJsonFormatter do
  context 'when parameter is nil' do
    it 'should returns blank array' do
      expect(described_class.format([])).to eq []
    end
  end

  context 'when has parameters' do
    let(:question1) { double(:question1, id: 1, asker: user, question: 'What???') }

    let(:answers) { double(:answers) }

    let(:answer1) { double(:answer1, id: 1, answer: 'Nothing', provider: user) }
    let(:answer2) { double(:answer2, id: 2, answer: 'Nothing', provider: user) }

    let(:user) { double(:user, name: 'Peter') }

    context 'and parameter is a collection' do
      let(:question2) { double(:question2, id: 2, asker: user, question: 'What you do???')}

      let(:answer3) { double(:answer3, id: 3, answer: 'Nothing', provider: user) }
      let(:answer4) { double(:answer4, id: 4, answer: 'Nothing', provider: user) }

      it 'should returns formatted json' do
        question1.should_receive(:answers).and_return(answers)
        answers.should_receive(:includes).with(:provider).and_return([answer1, answer2])

        question2.should_receive(:answers).and_return(answers)
        answers.should_receive(:includes).with(:provider).and_return([answer3, answer4])

        result = [
          {
            id: 1,
            asker: 'Peter',
            question: 'What???',
            answers:
              [
                { id: 1, answer: 'Nothing', provider: 'Peter' },
                { id: 2, answer: 'Nothing', provider: 'Peter' }
              ]
          },
          {
            id: 2,
            asker: 'Peter',
            question: 'What you do???',
            answers:
              [
                { id: 3, answer: 'Nothing', provider: 'Peter' },
                { id: 4, answer: 'Nothing', provider: 'Peter' }
              ]
          }
        ]

        expect(described_class.format([question1, question2])).to eq result
      end
    end

    context 'when parameter is a single object' do
      it 'should returns formatted json' do
        question1.should_receive(:answers).and_return(answers)
        answers.should_receive(:includes).with(:provider).and_return([answer1, answer2])

        result = [
          {
            id: 1,
            asker: 'Peter',
            question: 'What???',
            answers:
              [
                { id: 1, answer: 'Nothing', provider: 'Peter' },
                { id: 2, answer: 'Nothing', provider: 'Peter' }
              ]
          }
        ]

        expect(described_class.format(question1)).to eq result
      end
    end
  end
end
