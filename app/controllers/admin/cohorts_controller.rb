class Admin::CohortsController < AdminsController

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.name = @cohort.name.upcase_first
    p @cohort.instructor_id
    @instr = Instructor.find_by_id(@cohort.instructor_id)
    @cohort.instructor = @instr
    @instr.update_attribute(:active, true)
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

  def edit
    @cohort = Cohort.find_by_id(params[:id])
  end

  def update
    @cohort = Cohort.find_by_id(params[:id])
    @old_instr = Instructor.find_by_id(@cohort.instructor_id)
    @cohort.update(cohort_params)
    @instr = Instructor.find_by_id(@cohort.instructor_id)
    @cohort.instructor = @instr
    @instr.update_attribute(:active, true)
    @course = Course.find_by_id(@cohort.course_id)
    @cohort.course = @course
    if @old_instr.cohorts.count == 0
      @old_instr.update_attribute(:active, false)
    end
    if @cohort.valid?
      redirect_to "/cohorts/#{@cohort.id}"
    else
      flash[:error] = "Invalid credentials"
      render 'edit'
    end
  end

  def add_students
    @cohort = Cohort.find_by_id(params[:id])
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id, :course_id)
  end

end
