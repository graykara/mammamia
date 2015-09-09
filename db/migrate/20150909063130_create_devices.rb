class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :contract_id
      t.string :grade
      t.string :after_service
      t.string :code
      t.string :location
      t.integer :validated
      t.boolean :status
      t.text :note

      t.timestamps null: false
    end
  end
end
