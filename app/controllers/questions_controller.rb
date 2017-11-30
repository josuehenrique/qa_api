class QuestionsController < ApplicationController
  def index
    questions = Question.public_questions.ordered
    questions = ::QuestionJsonFormatter.format(questions)

    render status: status_identifyer(questions), json: questions
  end

  def show
    resource = Question.find_by(id: params[:id])
    resource = QuestionJsonFormatter.format(resource)

    render status: status_identifyer(resource), json: resource
  end
end
