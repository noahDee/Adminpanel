class InstructorsController < ApplicationController
  def index
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
        redirect_to '/instructor'
      else
        p @instr.errors.messages
        flash.now[:error] = "Invalid Credentials"
        render 'new'
      end
  end

  def show
  end

  private

  def instr_params
    params.require(:instructor).permit(:first_name, :last_name, :age, :salary, :education, :email, :password)
  end
end
