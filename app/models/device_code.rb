class DeviceCode < ActiveRecord::Base

  auditable only: [:update, :destroy]

  default_scope { order(created_at: :desc) }

  belongs_to :device

  has_many :device_histories

  scope :empty, -> { where(:device_id => nil) }

  def self.serial
    format('%03d', DeviceCode.count + 1)
  end
end
