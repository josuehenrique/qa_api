class QuestionsController < ApplicationController
  def index
    collection = Question.public_questions.ordered
    render status: status_identifyer(collection), json: collection
  end

  def show
    resource = Question.find_by(id: params[:id])
    render status: status_identifyer(resource), json: resource
  end
end
