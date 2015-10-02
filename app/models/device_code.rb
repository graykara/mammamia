class DeviceCode < ActiveRecord::Base
  belongs_to :device

  has_many :device_histories

  scope :empty, -> { where(:device_id => nil) }
end
