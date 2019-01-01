class CoursesController < ApplicationController
  def index
  end

  def edit
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.name = @course.name.upcase_first
    if @course.valid?
      @course.save
      redirect_to "/course/#{@course.id}"
    else
      flash[:error] = "Invalid Credentials"
      render 'new'
    end
  end

  def show
    @course = Course.find_by_id(params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:name, :class_hours)
  end
end
