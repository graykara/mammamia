class Device < ActiveRecord::Base

  default_scope { order(created_at: :desc) }

  belongs_to :contract
  has_one :device_code

  accepts_nested_attributes_for :device_code

  after_update :create_code

  private
    def create_code
      DeviceCode.find(self.code).update_attributes!(device_id: self.id) unless self.code.blank?
    end
end
