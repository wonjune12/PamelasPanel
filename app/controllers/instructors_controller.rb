class InstructorsController < ApplicationController
  
  def index 
    @instructors = Instructor.all
    respond_to do |format|
      format.html
      format.json {render json:@instructors}
    end

  end

  def new 
    @instructor = Instructor.new
  end

  def create    
    @instructor = Instructor.create(instructor_params)
    session[:instructor_id] = @instructor.id
    redirect_to instructors_path
  end
  
  def show
    @instructor = Instructor.find_by(id: params[:id])
    @cohortinstructor = Cohortinstructor.find_by(id: @instructor.id)
  end

  def edit
    @instructor = Instructor.find_by(id: params[:id])
  end

  def update
    @instructor = Instructor.find_by(id: params[:id])
    @instructor.update(instructor_params)
    if (@instructor.email?)
      flash[:error] = "This email is already registered"
    else
      @instructor.save
    end
    redirect_to instructors_path
  end

  #deletes instructor and it's relationship with cohort
  #however; allows the path to this page from the cohort's side even though it'll cause an error
  def destroy
    @instructor = Instructor.find_by(id: params[:id])
    @cohortinstructor = Cohortinstructor.find_by(id: @instructor.id)
    @cohortinstructor.destroy
    @instructor.destroy
    redirect_to instructors_path
  end

  def instructor_params
    params.require(:instructor).permit(:firstname,:lastname,:age,:degree,:email,:salary)
  end


end
