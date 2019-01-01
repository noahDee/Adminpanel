class StudentsController < ApplicationController
  before_action :require_login
  def index
    @students = Student.all
  end

  def edit
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.email.downcase!
    if @student.valid?
      @student.save
      redirect_to "/student/#{@student.id}"
    else
      p @student.errors.messages
      flash.now[:error] = "Invalid Credentials"
      render 'new'
    end
  end

  def show
    p session[:user_id]
    p session[:user]
    p params[:id]
    if session[:user] == 'student' && session[:user_id] == params[:id].to_i
    redirect_to '/student-home'

  else
    @student = Student.find(params[:id])
  end
end

def home
  p session[:user_id]
  p session[:user]
  @student = Student.find_by_id(session[:user_id])
end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :enrolled, :age, :education)
  end

  def require_login
    if session[:user] == nil || session[:user_id] == nil
      flash[:error] = "You must be logged in to access this page"
      redirect_to '/login'
  end
end
end
