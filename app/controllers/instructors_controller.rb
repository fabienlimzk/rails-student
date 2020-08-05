class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :destroy, :update]
  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  # GET
  def new
    @instructor = Instructor.new
  end

  # POST
  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      redirect_to instructors_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update(instructor_params)
      redirect_to instructors_path
    else
      render :edit      
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    if @instructor.destroy
      redirect_to instructors_path
    else
      render :show
    end
  end

  private
  
  def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:firstname, :lastname, :gender, :email, :age, :phonenumber)
  end
end
