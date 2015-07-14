class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :hospital_user_id
      t.integer :marketing_user_id
      t.string :hospital_code
      t.integer :studio_user_id
      t.boolean :partnership
      t.date :contracted_at
      t.integer :contract_renewal
      t.integer :setup_by
      t.boolean :setup_free
      t.integer :setup_fee
      t.boolean :setup_vat
      t.integer :equipment_by
      t.integer :equipment_quantity
      t.boolean :equipment_free
      t.boolean :equipment_fee
      t.boolean :equipment_vat
      t.integer :manage_by
      t.datetime :manage_start_at
      t.integer :manage_period
      t.boolean :manage_vat
      t.integer :manage_pay_by
      t.integer :marketing_company_id
      t.string :marketing_user_name
      t.boolean :marketing_fee_use
      t.integer :marketing_fee
      t.integer :marketing_fee_ratio
      t.boolean :marketing_fee_vat
      t.boolean :marketing_equipment_fee_free
      t.integer :marketing_equipment_fee
      t.integer :marketing_equipment_fee_ratio
      t.boolean :marketing_equipment_fee_vat

      t.timestamps null: false
    end
  end
end
