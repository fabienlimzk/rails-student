class StudentsController < ApplicationController
  before_action :new_student, only: [:new, :create]
  before_action :set_student, only: [:show, :edit]

  def index
    @students = Student.all
  end

  def show
    # no need to put anything coz of private set_student
    # @instructor = Instructor.find(params[:instructor_id])
    # student = Student.find(params[:id])
  end

  def new
    @student = @course.students.build
  end

  def create
    @student = @course.students.build(student_params)
    if @student.save
      redirect_to course_path(@course)
    else
      render :new      
    end
  end

  def edit
    @course = Course.find(params[:course_id])
  end

  def update
    @student = Student.find(params[:id])
    course = Course.find(params[:course_id])
    if @student.update(student_params)
      redirect_to course_path(course)
    else
      render :edit      
    end
  end
  
  def destroy
    @student = Student.find(params[:id]).destroy
    course = Course.find(params[:course_id])
    redirect_to course_path(course)
  end

  private
  
  def new_student
    @course = Course.find(params[:course_id])
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:firstname, :lastname, :gender, :email, :age, :phonenumber, :course_id, instructor_ids: [])
  end
end