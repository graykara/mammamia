class DeviceHistory < ActiveRecord::Base

  default_scope { order(created_at: :desc) }

  belongs_to :device_code
end
