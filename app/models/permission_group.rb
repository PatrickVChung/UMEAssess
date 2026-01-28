class PermissionGroup < ActiveRecord::Base
  has_many :users, inverse_of: :permission_group
end
