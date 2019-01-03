class Admin::CoursesController < AdminsController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.name = @course.name.upcase_first
    if @course.valid?
      @course.save
      redirect_to "/courses/#{@course.id}"
    else
      flash.now[:error] = "Invalid Credentials"
      render 'new'
    end
  end

  def edit
    @course = Course.find_by_id(params[:id])
  end

  def update
    @course = Course.find_by_id(params[:id])
    @course.update(course_params)
    if @course.valid?
      redirect_to "/courses/#{@course.id}"
    else
      flash.now[:error] = "Invalid Credentials"
      render 'edit'
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :class_hours)
  end

end
