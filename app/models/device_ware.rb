class DeviceWare < ActiveRecord::Base

  validates :version, presence: true, length: {minimum: 2, maximum: 4}

  scope :scope_by_category, -> (category) { where(category: category) }

end
