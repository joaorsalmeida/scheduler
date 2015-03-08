require 'rails_helper'

RSpec.describe "schedule/index.html.erb", type: :view do
  context "view schedule" do
    it "display appointments" do
      assign :start_date, DateTime.new(2013,5,1)
      assign :end_date, DateTime.new(2013, 5, 3)
      assign :dates, [DateTime.new(2013,5,1), DateTime.new(2013,5,2), DateTime.new(2013,5,3)]
      assign :events, [Appointment.new({ title: "Titulo", date: DateTime.new(2013,5,2,10,0) })]
      render
      expect(rendered).to include "Titulo"
    end
  end
end
