class AddCodeMetaDataIdToDeviceCodes < ActiveRecord::Migration
  def change
    add_column :device_codes, :hw_id, :integer
    add_column :device_codes, :sw_id, :integer
    add_column :device_codes, :fw_id, :integer
  end
end
