class ChangeLog < ActiveRecord::Base

  default_scope { order(created_at: :desc) }

end
