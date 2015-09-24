class FixClumnNameToDeveceWares < ActiveRecord::Migration
  def change
    rename_column :device_wares, :purchsed_at, :purchased_at
  end
end
