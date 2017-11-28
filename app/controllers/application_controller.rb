class ApplicationController < ActionController::API
  protected

  def status_identifyer(collection)
    collection.blank? ? 204 : 200
  end
end
