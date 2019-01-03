class InstructorsController < ApplicationController
  before_action :require_login

  def index
    @instructors = Instructor.all
  end


  def show
    if session[:user] == 'instructor' && session[:user_id] == params[:id].to_i
    redirect_to '/instructor-home'
    else
    @instr = Instructor.find(params[:id])
    end
  end

  def home
    @instr = Instructor.find_by_id(session[:user_id])
  end

  def edit
    @instr = Instructor.find_by_id(session[:user_id])
  end

  def update
    @instr = Instructor.find_by_id(session[:user_id])
    @instr.update(instr_params)
    @instr.email.downcase!
    if @instr.valid?
      redirect_to instructor_home_path
    else
      flash[:error] = "Invalid Credentials"
      render 'edit'
    end
  end
  
  private

  def instr_params
    params.require(:instructor).permit(:email, :password)
  end

  def require_login
    if session[:user] != 'instructor'
      flash[:error] = "You must be logged in to access this page"
      redirect_to '/login'
    end
  end

end
