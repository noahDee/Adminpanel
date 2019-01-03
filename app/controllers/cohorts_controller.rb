class CohortsController < ApplicationController
  def index

  end

  def edit
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.name = @cohort.name.upcase_first
    p @cohort.instructor_id
    @instr = Instructor.find_by_id(@cohort.instructor_id)
    @cohort.instructor = @instr
    @instr.cohorts << @cohort
    @course = Course.find_by_id(@cohort.course_id)
    @cohort.course = @course
    @course.cohorts << @cohort
    if @cohort.valid?
      @cohort.save
      redirect_to "/cohorts/#{@cohort.id}"
    else
      flash[:error] = "Invalid credentials"
      render 'new'
    end
  end

  def show
    @cohort = Cohort.find_by_id(params[:id])
  end

  private

  # def cohort_params
  #   params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id, :course_id)
  # end

  def cohort_init

  end
end
