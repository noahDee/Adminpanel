class Admin::StudentsController < AdminsController

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.email.downcase!
    if @student.valid?
      @student.save
      redirect_to "/students/#{@student.id}"
    else
      p @student.errors.messages
      flash.now[:error] = "Invalid Credentials"
      render 'new'
    end
  end

  def index
    @students = Student.all
  end

  def edit
    @student = Student.find_by_id(params[:id])
  end

  def update
    @student = Student.find_by_id(params[:id])
    @student.update(student_params)

    if @student.valid?
      redirect_to "/students/#{@student.id}"
    else
      flash.now[:error] = "Invalid Credentials"
      render 'edit'
    end
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :enrolled, :age, :education)
  end

end
