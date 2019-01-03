class Admin::InstructorsController < AdminsController
  

  def new
    @instr = Instructor.new
  end

  def create
    @instr = Instructor.new(instr_params)
    @instr.email.downcase!
      if @instr.valid?
        @instr.save
        redirect_to "/instructors/#{@instr.id}"
      else
        p @instr.errors.messages
        flash.now[:error] = "Invalid Credentials"
        render 'new'
      end
  end

  def edit
    @instr = Instructor.find_by_id(params[:id])
  end

  def update
    @instr = Instructor.find_by_id(params[:id])
    @instr.update(instr_params)
      if @instr.valid?
        redirect_to "/instructors/#{@instr.id}"
      else
        flash.now[:error] = "Invalid Credentials"
        render 'edit'
      end
  end

  private

  def instr_params
    params.require(:instructor).permit(:first_name, :last_name, :age, :salary, :education, :email, :password)
  end
end
