class HomeController < ApplicationController
  def dashboard
    render json: DashboardJsonGenerator.generate
  end
end
