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
  end

  def edit
    @instructor = Instructor.find_by(id: params[:id])
  end

  def update
    @instructor = Instructor.find_by(id: params[:id])
    @instructor.update(instructor_params)
    @instructor.save
    redirect_to instructors_path
  end

  def destroy
    
  end

  def instructor_params
    params.require(:instructor).permit(:firstname,:lastname,:age,:degree,:email,:salary)
  end


end
