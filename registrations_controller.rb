class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end
  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to registration_path(@registration), notice: "Your club selection has been saved."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @registration = Registration.find(params[:id])
  end
  private
  def registration_params
    params.require(:registration).permit(:student_name, :student_class, :section, :email, :club)
  end
end
