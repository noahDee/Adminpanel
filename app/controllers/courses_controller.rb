class CoursesController < ApplicationController
  def index
  end

  def edit
  end


  def show
    @course = Course.find_by_id(params[:id])
  end

  private

  # def course_params
  #   params.require(:course).permit(:name, :class_hours)
  # end
end
