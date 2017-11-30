class QuestionJsonFormatter
  def initialize(questions)
    @questions = [questions].flatten.compact
  end

  def self.format(*attr)
    new(*attr).format
  end

  def format
    [].tap do |result|
      questions.each { |question| result << (make_question_hash(question)) }
    end
  end

  private

  def make_question_hash(question)
    {
      id: question.id,
      asker: question.asker.name,
      question: question.question,
      answers: make_answer_hash(question.answers.includes(:provider))
    }
  end

  def make_answer_hash(answers)
    [].tap do |result|
      answers.each do |answer|
        result << {
          id: answer.id,
          answer: answer.answer,
          provider: answer.provider.name
        }
      end
    end
  end

  attr_reader :questions
end
