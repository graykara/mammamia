class Contract < ActiveRecord::Base
  has_one   :hospital_user, class_name: 'User'
  has_many  :studio_users, -> { where(user_type: 2) }, class_name: 'User'

  accepts_nested_attributes_for :hospital_user
  accepts_nested_attributes_for :studio_users

  def self.search_by_user_type(query, category)
    if category == 'hospital'
      joins(hospital_user: :partner_detail).where('partner_details.corp_name LIKE ?', "%#{query}%")
    elsif category == 'studio'
      joins(studio_users: :partner_detail).where('partner_details.corp_name LIKE ?', "%#{query}%")
    elsif category == 'reg'
      joins(hospital_user: :partner_detail).where('partner_details.biz_reg_number LIKE ?', "%#{query}%")
    elsif category == 'all'
      joins(hospital_user: :partner_detail).where('partner_details.corp_name LIKE ?', "%#{query}%").joins(studio_users: :partner_detail).where('partner_details.corp_name LIKE ?', "%#{query}%")
    end
  end

  scope :with_hospital, -> { joins(:hospital_user) }
  scope :with_studio,   -> { joins(:studio_users) }

end
