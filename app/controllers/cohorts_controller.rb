class CohortsController < ApplicationController

  before_action :authenticate_user!
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
    @cohortstudent = Cohortstudent.find_by(cohort_id: @cohort.id)
  end
  
  def edit
    @cohort = Cohort.find(params[:id])
  end

  def update
    @cohort = Cohort.find_by(id: params[:id])
    @cohort.update(cohort_params)
    @cohortinstructor = Cohortinstructor.find_by(id: @cohort.id)
    @cohortinstructor.update(
      instructor_id: params[:cohort][:instructor_id]
      )
    redirect_to cohorts_path
  end

  #deletes cohort and it's relationship with the instructor
  #however; allows the path to this page from the instructor's side even though it'll cause an error
  def destroy
    @cohort = Cohort.find_by(id: params[:id])
    @cohortinstructor = Cohortinstructor.find_by(cohort_id: @cohort_id)
    @cohortinstructor.destroy
    @cohort.destroy
    redirect_to cohorts_path
  end

  private
  def cohort_params
    params.require(:cohort).permit(:title,:start_date,:end_date,:course_id)
  end

end
