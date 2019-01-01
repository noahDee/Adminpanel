class SessionsController < ApplicationController
  before_action :reset_session
  def new

  end


def create
  p params[:session]
  if params['user'] == "Student"
    student_login
  elsif params['user'] == "Instructor"
    instructor_login
  elsif params['user'] == "Admin"
    admin_login
  end
  end
end








  private

  def student_login
    user = Student.find_by(email: params[:session]["email"].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        session[:user] = 'student'
          redirect_to "/student-home"
      else
        flash[:danger] = "Invalid Credentials"
        render 'new'
      end
  end

  def instructor_login
    user = Instructor.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:user] = 'instructor'
        redirect_to '/instructor'
      else
        flash.now[:danger] = "Invalid Credentials"
        render 'new'
      end
  end

  def admin_login
    user = Admin.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:user] = 'admin'
      redirect_to '/admin'
    else
      flash.now[:danger] = "Invalid Credentials"
      render 'new'
    end
  end
