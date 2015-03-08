class AppointmentsController < ApplicationController

  before_filter :load_appointment, except: :create
  before_filter :authenticate_user!, except: :show

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    if(@appointment.save)
      render json: @appointment
    else
      render json: @appointment.errors, status: 500
    end
  end

  def destroy
    if (@appointment.destroy)
      render json: "Appointment destroyed", status: 200
    else
      render json: "Error destroying appointment", status: 500
    end
  end

  def show
    if (@appointment)
      render json: @appointment
    else
      render json: "Appointment not found", status: 404
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:title, :date, :time)
  end

  def load_appointment
    begin
      @appointment = Appointment.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @appointment = nil
    end
  end

end
