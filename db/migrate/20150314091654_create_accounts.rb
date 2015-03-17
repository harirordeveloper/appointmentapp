class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.belongs_to :physician, index: true
      t.belongs_to :patient, index: true
      t.timestamps
    end
  end
end
