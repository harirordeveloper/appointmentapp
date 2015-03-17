class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :patient, index: true
      t.string :name
      t.string :reason
      t.datetime :start
      t.datetime :end
      t.string :email
      t.string :mobile

      t.timestamps
    end
  end
end
