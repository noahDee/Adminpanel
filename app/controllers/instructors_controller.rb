class InstructorsController < ApplicationController
  before_action :require_login
  def index
    @instructors = Instructor.all
  end

  def edit
  end

  def new
    @instr = Instructor.new
  end

  def create
    @instr = Instructor.new(instr_params)
    @instr.email.downcase!
      if @instr.valid?
        @instr.save
        redirect_to "/instructor/#{@instr.id}"
      else
        p @instr.errors.messages
        flash.now[:error] = "Invalid Credentials"
        render 'new'
      end
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
  private

  def instr_params
    params.require(:instructor).permit(:first_name, :last_name, :age, :salary, :education, :email, :password)
  end

  def require_login
    if session[:user] == nil || session[:user_id] == nil
      flash[:error] = "You must be logged in to access this page"
      redirect_to '/login'
  end
end
end
