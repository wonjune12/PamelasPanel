class CoursesController < ApplicationController
  
  def index 
    @courses = Course.all
  end
  
  def new
    @course = Course.new
  end

  def create 
    @course = Course.create(course_params)
    redirect_to courses_path
  end

  def show
    @course= Course.find_by(id: params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    redirect_to courses_path
  end

  def destroy 
  
  end

  private
  def course_params
    params.require(:course).permit(:title,:courseInfo,:hoursinclass)
  end

end
