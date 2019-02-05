class CohortsController < ApplicationController

  def index 
    @cohorts = Cohort.all
  end
  
  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.create(cohort_params)
    redirect_to cohorts_path
  end

  def show
    @cohort = Course.find(params[:id])
  end
  
  def edit
    @student = Student.find(params[:id])
  end

  def update
    @cohort = Cohort.update(cohort_params)
    redirect_to cohorts_path
  end

  def destroy

  end

  private
  def cohort_params
    params.require(:cohort).permit(:title,:start_date,:end_date )
  end
end
