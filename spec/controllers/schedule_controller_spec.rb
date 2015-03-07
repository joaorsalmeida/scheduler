require 'rails_helper'

RSpec.describe ScheduleController, type: :controller do

  describe "GET #index" do
    it "find current week" do
      start_date = DateTime.new(2015,3,1)
      end_date = DateTime.new(2015,3,8)
      allow(DateTime).to receive(:now) { start_date }
      get :index
      expect(assigns(:start_date)).to eq(start_date)
      expect(assigns(:end_date)).to eq(end_date)
    end
  end

end
