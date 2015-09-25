class AddSetupAtToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :setup_at, :date
  end
end
