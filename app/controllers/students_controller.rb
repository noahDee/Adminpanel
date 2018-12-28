class StudentsController < ApplicationController
  def index
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
      redirect_to '/student'
    else
      p @student.errors.messages
      flash.now[:error] = "Invalid Credentials"
      render 'new'
    end
  end

  def show
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :enrolled, :age, :education)
  end
end
