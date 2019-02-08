class StudentsController < ApplicationController
  
  def index 
    @students = Student.all
  end

  def new 
    @students = Student.new
    @cohortstudent = Cohortstudent.new
  end
  
  def create    
    @students = Student.create(student_params)
    @cohortstudent = Cohortstudent.create(
      student_id: @students.id,
      cohort_id: params[:student][:cohort_id]
    )
    redirect_to students_path
  end
  
  def show
    @student = Student.find_by(id: params[:id])
  end

  def edit
    @student = Student.find_by(id: params[:id])
  end

  def update
    @student = Student.find_by(id: params[:id])
    @student.update(student_params)
    redirect_to students_path
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  private
  def student_params
    params.require(:student).permit(:firstname,:lastname,:age,:degree,:email)
  end


end