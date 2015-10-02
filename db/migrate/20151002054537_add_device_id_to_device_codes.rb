class AddDeviceIdToDeviceCodes < ActiveRecord::Migration
  def change
    add_column :device_codes, :device_id, :integer
  end
end
