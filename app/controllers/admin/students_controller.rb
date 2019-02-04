class Admin::StudentsController < AdminsController

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(new_student_params)
    @student.email.downcase!
    @student.password = (0...8).map { (65 + rand(26)).chr }.join
    if @student.valid?
      @student.save
      redirect_to "/admin/students/#{@student.id}"
    else
      p @student.errors.messages
      flash.now[:danger] = "Invalid Credentials"
      render 'new'
    end
  end

  def index
  end

  def edit
    @student = Student.find_by_id(params[:id])
  end

  def update
    #   trying password confirm before change
  #   @admin = Admin.find_by_id(session[:user_id])
  # if @admin && @admin.authenticate(admin_confirm_params)

    @student = Student.find_by_id(params[:id])
    @student.update(edit_student_params)

    if @student.valid?
      redirect_to "/admin/students/#{@student.id}"
    else
      flash.now[:danger] = "Invalid Credentials"
      render 'edit'
    end

  end

  def show
    @student = Student.find_by_id(params[:id])
  end

  def destroy
    @student = Student.find_by_id(params[:id])
    respond_to do |format|
      format.js
    end
    @student.destroy
    # redirect_to new_admin_student_path
  end

  private
  def new_student_params
    params.require(:student).permit(:first_name, :last_name, :email, :enrolled, :age, :education)
  end

  def edit_student_params
    params.require(:student).permit(:first_name, :last_name, :email, :enrolled, :age, :education)
  end

  def admin_confirm_params
    params.require(:admin).permit(:password)
  end

end
