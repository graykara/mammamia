class CreateChangeLogs < ActiveRecord::Migration
  def change
    create_table :change_logs do |t|
      t.integer :user
      t.string :controller
      t.string :action
      t.datetime :changed_at
      t.text :log
      t.text :description

      t.timestamps null: false
    end
  end
end
