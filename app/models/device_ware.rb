class DeviceWare < ActiveRecord::Base

  default_scope { order(created_at: :desc) }

  validates :version, presence: true, length: {minimum: 2, maximum: 4}

  scope :scope_by_category, -> (category) { where(category: category) }

end
