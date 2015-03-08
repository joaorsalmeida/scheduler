require 'rails_helper'

RSpec.describe Appointment, type: :model do
  context "when valid" do
    it "should save" do
      appointment = Appointment.new title: "Title", date: DateTime.new
      expect(appointment.save).to be true
    end
  end

  context "when not valid" do
    it "should not save" do
      appointment = Appointment.new
      expect(appointment.save).to be false
    end
  end
end
