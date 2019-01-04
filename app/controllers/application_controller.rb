class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    unless session[:user]
      flash[:error] = "You must be logged in to access this page"
      redirect_to '/login'
    end
  end
end
