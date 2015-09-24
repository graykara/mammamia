class CreateDeviceWares < ActiveRecord::Migration
  def change
    create_table :device_wares do |t|
      t.string :version
      t.string :category
      t.string :name
      t.string :spec
      t.string :serial
      t.integer :grade
      t.date :expired_at
      t.date :purchsed_at
      t.string :firmware
      t.string :check_period
      t.string :note
      t.string :os
      t.string :application
      t.date :acquired_at
      t.date :distributed_at
      t.string :tag

      t.timestamps null: false
    end
  end
end
