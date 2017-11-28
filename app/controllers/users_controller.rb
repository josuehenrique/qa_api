class UsersController < ApplicationController
  def index
    collection = User.active.ordered
    render status: status_identifyer(collection), json: collection
  end

  def show
    resource = User.find_by(id: params[:id])
    render status: status_identifyer(resource), json: resource
  end
end
