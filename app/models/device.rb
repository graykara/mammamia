class Device < ActiveRecord::Base
  belongs_to :contract
  has_one :device_code

  accepts_nested_attributes_for :device_code

  after_update :create_code

  private
    def create_code
      DeviceCode.find(self.code).update_attributes!(device_id: self.id) unless self.code.blank?
    end
end
