class RemoveTimeFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :time
    change_column :appointments, :date, :datetime
  end
end
