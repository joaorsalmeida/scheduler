class AppointmentsController < ApplicationController

  def create
    @appointment = Appointment.new(appointment_params)
    if(@appointment.save)
      render json: @appointment
    else
      render json: @appointment.errors, status: 500
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    if (appointment.destroy)
      render json: "Appointment destroyed", status: 200
    else
      render json: "Error destroying appointment", status: 500
    end
  end

  def show
  end

  private
  def appointment_params
    params.require(:appointment).permit(:title, :date, :time)
  end
end
