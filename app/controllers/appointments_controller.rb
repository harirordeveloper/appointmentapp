class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  respond_to :html,:json

  def index
    @events = []
    user_type_id = current_user.meta_id
    user_type = current_user.meta_type
    if(user_type =="Patient")
      patient = Patient.find_by_id(user_type_id)
      @appointments = patient.appointments
    elsif(user_type =="Doctor")
      doctor = Doctor.find_by_id(user_type_id)
      @appointments = doctor.appointments
    end
    @doctors  = Doctor.all
    @appointments.each do |app|
      puts app.inspect
      @events << {:id => app.id, :title => "#{app.name} : #{app.reason}", :start => app.start,:end => app.end }
    end
    respond_with(@events)
  end

  def show
    respond_with(@appointment)
  end

  def new
    @doctorId = params[:doctorId]
    @appointment = Appointment.new
    respond_with(@appointment)
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.patient_id = params["patient_id"]
    @appointment.doctor_id = params["physician_id"]
    @appointment.save
    respond_with(@appointment)
  end

  def update
    @appointment.update(appointment_params)
    respond_with(@appointment)
  end

  def destroy
    @appointment.destroy
    respond_with(@appointment)
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:name, :reason, :start, :end, :email, :mobile)
    end
end
