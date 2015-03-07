class AppointmentsController < ApplicationController

  def create
    @appointment = Appointment.new(appointment_params)
    if(@appointment.save)
      render json: @appointment
    else
      render json: @appointment.errors, status: 500
    end
  end

  def update
  end

  def destroy
  end

  def show
  end

  private
  def appointment_params
    params.require(:appointment).permit(:title, :date, :time)
  end
end
