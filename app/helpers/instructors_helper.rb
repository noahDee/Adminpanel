module InstructorsHelper
  def require_login
    if session[:user] = nil
      flash[:error] = "You must be logged in to access this page"
      redirect_to '/login'
    end
  end
end
