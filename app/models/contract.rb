class Contract < ActiveRecord::Base
  has_one   :hospital_user, class_name: 'User'
  has_many  :studio_users, -> { where(user_type: 2) }, class_name: 'User'

  accepts_nested_attributes_for :hospital_user
  accepts_nested_attributes_for :studio_users

  def self.search(query)
    where('')
  end

end
