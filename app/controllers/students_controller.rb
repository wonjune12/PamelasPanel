class StudentsController < ApplicationController
  
  def index 
    @students = Student.all
  end

  def new 
    @students = Student.new
  end
  
  def create    
    @students = Student.create(student_params)

    redirect_to students_path
  end
  
  def show
    @student = Student.find_by(id: params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to students_path
  end

  def destroy

  end

  private
  def student_params
    params.require(:student).permit(:firstname,:lastname,:age,:degree,:email,:cohort,:cohort)
  end


end