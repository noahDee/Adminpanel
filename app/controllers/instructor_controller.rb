class InstructorController < ApplicationController
  def index
  end

  def edit
  end

  def new
    @instructor = Instructor.new
  end

  def show
  end

  private

  def instr_params
    params.require(:instructor).permit(:first_name, :last_name, :age, :salary, :password, :active, :email, :education)
  end
end
