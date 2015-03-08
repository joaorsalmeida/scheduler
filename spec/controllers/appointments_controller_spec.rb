require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do

  let(:user) { User.create({email: "joao@scheduler.com", password: "12345678"}) }
  let(:appointment_params) { { title: "Titulo", date: DateTime.now } }

  context "signed user" do 
    before :example do
      sign_in user
    end

    describe "POST #create" do
      it "create valid appointment" do
        post :create, appointment: appointment_params
        expect(response).to have_http_status(:success)
      end

      it "error on invalid appointment" do
        post :create, appointment: { any: "value" }
        expect(response).to have_http_status(:error)
      end
    end

    describe "DELETE #destroy" do
      it "returns http success" do
        appointment = Appointment.new(appointment_params)
        appointment.user = user
        appointment.save!
        delete :destroy, id: appointment.id
        expect(response).to have_http_status(:success)
      end
    end
  end

  context "visitor" do
   describe "POST #create" do
      it "create valid appointment" do
        post :create, appointment: appointment_params
        expect(response).to have_http_status(302)
      end

      it "error on invalid appointment" do
        post :create, appointment: { any: "value" }
        expect(response).to have_http_status(302)
      end
    end

    describe "DELETE #destroy" do
      it "returns http success" do
        appointment = Appointment.create(appointment_params)
        delete :destroy, id: appointment.id
        expect(response).to have_http_status(302)
      end
    end

  end

  describe "GET #show" do
    it "returns http success" do
      appointment = Appointment.create(appointment_params)
      appointment.user = user
      appointment.save!
      get :show, id: appointment.id
      expect(response).to have_http_status(:success)
    end

    it "return 404" do
      get :show, id: 1
      expect(response).to have_http_status(:not_found)
    end
  end

end
