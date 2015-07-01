class CreatePartnerDetails < ActiveRecord::Migration
  def change
    create_table :partner_details do |t|
      t.integer :user_type
      t.string :corp_name
      t.string :nick_name
      t.boolean :event_published
      t.string :biz_reg_number
      t.string :reg_code
      t.string :zipcode
      t.string :address_1
      t.string :address_2
      t.string :chief_name
      t.string :fax
      t.string :biz_name
      t.string :biz_email
      t.string :biz_dept
      t.string :biz_tel
      t.string :biz_cell
      t.string :fin_name
      t.string :fin_email
      t.string :fin_dept
      t.string :fin_tel
      t.string :fin_cell
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
