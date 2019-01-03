class StudentsController < ApplicationController
  before_action :require_login


  def show
    p session[:user_id]
    p session[:user]
    p params[:id]
    if session[:user] == 'student' && session[:user_id] == params[:id].to_i
    render '/student-home'

  else
    @student = Student.find(params[:id])
  end
end

  def home
    p session[:user_id]
    p session[:user]
    @student = Student.find_by_id(session[:user_id])
  end

  def edit
    @student = Student.find_by_id(session[:user_id])
  end

  def update
    @student = Student.find_by_id(session[:user_id])
    @student.update(student_params)
    @student.email.downcase!
    if @student.valid?
      redirect_to home_path
    else
      flash[:error] = "Invalid Credentials"
      render 'edit'
    end
  end

  private

  def student_params
    params.require(:student).permit(:email, :password)
  end

  def require_login
    if session[:user] != "student"
      flash.now[:error] = "You must be logged in to access this page"
      redirect_to '/login'
  end
end
end
