class CreatePhysicians < ActiveRecord::Migration
  def change
    create_table :physicians do |t|
      t.string :name
      t.string :speciality
      t.string :experience
      t.string :fee

      t.timestamps
    end
  end
end
