class ChangeDateFormatAtContracts < ActiveRecord::Migration
  def change
    change_column :contracts, :manage_start_at, :date
  end
end
