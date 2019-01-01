class AdminsController < ApplicationController
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
end
