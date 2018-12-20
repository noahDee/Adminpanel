class CoursesController < ApplicationController
  def index
  end

  def edit
  end

  def new
    @course = Course.new
  end

  def show
  end

  private

  def course_params
    params.require(:course).permit(:name, :class_hours)
  end
end
