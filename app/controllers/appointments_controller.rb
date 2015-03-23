class AppointmentsController < ApplicationController

  before_filter :load_appointment, except: [:new, :create]
  before_filter :authenticate_user!, except: :show

  def new
    @appointment = Appointment.new(date: params[:date])
    puts @appointment.inspect
    render :new, layout: false
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    respond_to do |format|
      if(@appointment.save)
        format.js { render action: 'show', status: :created, location: @appointment }
      else
        format.js { render json: @appointment.errors, status: 500 }
      end
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
