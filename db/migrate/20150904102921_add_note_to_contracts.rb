class AddNoteToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :note, :text
  end
end
