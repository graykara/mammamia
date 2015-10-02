class CreateDeviceCodes < ActiveRecord::Migration
  def change
    create_table :device_codes do |t|
      t.string :code
      t.string :setup_user_name

      t.timestamps null: false
    end
  end
end
