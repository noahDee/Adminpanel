class CohortController < ApplicationController
  def index
  end

  def edit
  end

  def new
    @cohort = Cohort.new
  end

  def show
  end

  private
  
  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id,)
  end
end
