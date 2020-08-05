class CoursesController < ApplicationController
  before_action :new_course, only: [:new, :create]
  before_action :set_course, only: [:show, :edit]
  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = @instructor.courses.build
  end

  def create
    @course = @instructor.courses.build(course_params)
    if @course.save
      redirect_to instructor_path(@instructor)
    else
      render :new      
    end
  end

  def edit
    @instructor = Instructor.find(params[:instructor_id])
  end

  def update
    @course = Course.find(params[:id])
    instructor = Instructor.find(params[:instructor_id])
    
    if @course.update(course_params)
      redirect_to instructor_path(instructor)
    else
      render :edit      
    end
  end

  def destroy
    @course = Course.find(params[:id]).destroy
    instructor = Instructor.find(params[:instructor_id])
    redirect_to instructor_path(instructor)
  end

  private
  
  def new_course
    @instructor = Instructor.find(params[:instructor_id])
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :instructor_id)
  end
end
