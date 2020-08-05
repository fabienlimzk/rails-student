class InterestsController < ApplicationController
  before_action :new_interest, only: [:new, :create]
  before_action :set_interest, only: [:show, :edit]

  def index
    @interests = Interest.all
  end

  def show
  end

  def new
    @interest = @student.interests.build
    #NV+
  end

  def create
    @interest = @student.interests.build(interest_params)

    if @interest.save 
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:student_id])
  end

  def update
    @interest = Interest.find(params[:id])
    student = Student.find(params[:student_id])
    if @interest.update(interest_params)
      redirect_to student_path(student)
    else
      render :edit
    end
  end

  def destroy
    Interest.find(params[:id]).destroy
    student = Student.find(params[:student_id])
    redirect_to student_path(student)
  end

  private

  def new_interest
    @student = Student.find(params[:student_id])
  end
  def set_interest
    @interest = Interest.find(params[:id])
  end

  def interest_params
    params.require(:interest).permit(:name, :student_id)
  end
end
