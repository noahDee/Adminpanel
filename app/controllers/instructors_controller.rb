class InstructorsController < ApplicationController
  def index
  end

  def edit
  end

  def new
    @instr = Instructor.new
  end

  def show
  end

  private

  def instr_params
    params.require(:instructor).permit(:first_name, :last_name, :age, :salary, :education, :email, :active, :password)
  end
end
