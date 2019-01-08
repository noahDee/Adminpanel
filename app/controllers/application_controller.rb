class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :set_raven_context


  private
  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def require_login
    unless session[:user]
      flash[:error] = "You must be logged in to access this page"
      redirect_to '/login'
    end
  end
end
