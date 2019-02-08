class CohortsController < ApplicationController

  def index 
    @cohorts = Cohort.all
  end
  
  def new
    @cohort = Cohort.new
    @cohortinstructor = Cohortinstructor.new
  end

  def create
    
    @cohort = Cohort.create(cohort_params)
    @cohortinstructor = Cohortinstructor.create(
      cohort_id: @cohort.id,
      instructor_id: params[:cohort][:instructor_id]
    )
    redirect_to cohorts_path
  end

  def show
    @cohort = Cohort.find(params[:id])
    @cohortinstructor = Cohortinstructor.find_by(cohort_id: @cohort.id)
  end
  
  def edit
    @cohort = Cohort.find(params[:id])
  end

  def update
    @cohort = Cohort.update(cohort_params)
    redirect_to cohorts_path
  end

  def destroy

  end

  private
  def cohort_params
    params.require(:cohort).permit(:title,:start_date,:end_date,:course_id)
  end

end
