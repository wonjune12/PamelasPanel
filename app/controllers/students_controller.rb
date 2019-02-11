class StudentsController < ApplicationController
  before_action :authenticate_user!
  def index 
    @students = Student.all
  end

  def new 
    @student = Student.new
    @cohortstudent = Cohortstudent.new
  end
  
  def create    
    @student = Student.create(student_params)
    @cohortstudent = Cohortstudent.create(
      student_id: @student.id,
      cohort_id: params[:student][:cohort_id]
    )
    redirect_to students_path
  end
  
  def show
    @student = Student.find_by(id: params[:id])
    @cohortstudent = Cohortstudent.find_by(id: @student.id)
  end

  def edit
    @student = Student.find_by(id: params[:id])
  end

  def update
    @student = Student.find_by(id: params[:id])
    @cohortstudent = Cohortstudent.find_by(student_id: @student.id)
    @cohortstudent.update(cohort_id: params[:student][:cohort_id])
    @student.update(student_params)
    redirect_to students_path
  end

  #deletes student and it's relationship with cohort
  #however; allows the path to this student's page from cohort's side even though it'l cause an error
  def destroy
    @student = Student.find(params[:id])
    @cohortstudent = Cohortstudent.find_by(student_id: @student.id)
    @cohortstudent.destroy
    @student.destroy
    redirect_to students_path
  end

  private
  def student_params
    params.require(:student).permit(:firstname,:lastname,:age,:degree,:email)
  end


end