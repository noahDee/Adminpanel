class StudentController < ApplicationController
  def index
  end

  def edit
  end

  def new
    @student = Student.new
  end

  def show
  end

  private

  def student_params
    params.require(:student).permits(:first_name, :last_name, :email, :password, :enrolled, :age, :education)
  end
end
