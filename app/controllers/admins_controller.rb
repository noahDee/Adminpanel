class AdminsController < ApplicationController
  before_action :require_admin

  def new
    @admin = Admin.new
  end

  def create
  end

  def edit
  end

  def show
    @admin = Admin.find_by_id(session[:user_id])
  end

  private
  def require_admin
    if session[:user] != "admin"
      flash.now[:error] = "You do not have access to this page"
      redirect_to login_path
  end
end
end
