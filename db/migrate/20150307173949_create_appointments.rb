class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :title
      t.date :date
      t.time :time

      t.timestamps null: false
    end
  end
end
