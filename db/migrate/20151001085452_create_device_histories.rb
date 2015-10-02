class CreateDeviceHistories < ActiveRecord::Migration
  def change
    create_table :device_histories do |t|
      t.integer :device_code_id
      t.integer :status
      t.string :history

      t.timestamps null: false
    end
  end
end
