require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do

  context "signed user" do 

    before :example do
      user = User.create(email: "joao@scheduler.com", password: "12345678")
      sign_in user
    end

    describe "POST #create" do
      it "create valid appointment" do
        post :create, appointment: {title: "Title", date: Date.new}
        expect(response).to have_http_status(:success)
      end

      it "error on invalid appointment" do
        post :create, appointment: { any: "value" }
        expect(response).to have_http_status(:error)
      end
    end

    describe "DELETE #destroy" do
      it "returns http success" do
        appointment = Appointment.create title: "Title", date: Date.new
        delete :destroy, id: appointment.id
        expect(response).to have_http_status(:success)
      end
    end
  end

  context "visitor" do
   describe "POST #create" do
      it "create valid appointment" do
        post :create, appointment: {title: "Title", date: Date.new}
        expect(response).to have_http_status(302)
      end

      it "error on invalid appointment" do
        post :create, appointment: { any: "value" }
        expect(response).to have_http_status(302)
      end
    end

    describe "DELETE #destroy" do
      it "returns http success" do
        appointment = Appointment.create title: "Title", date: Date.new
        delete :destroy, id: appointment.id
        expect(response).to have_http_status(302)
      end
    end

  end

  describe "GET #show" do
    it "returns http success" do
      appointment = Appointment.create title: "Title", date: Date.new
      get :show, id: appointment.id
      expect(response).to have_http_status(:success)
    end

    it "return 404" do
      get :show, id: 1
      expect(response).to have_http_status(:not_found)
    end
  end

end
