class DeviceCode < ActiveRecord::Base

  default_scope { order(created_at: :desc) }

  belongs_to :device

  has_many :device_histories

  scope :empty, -> { where(:device_id => nil) }
end
