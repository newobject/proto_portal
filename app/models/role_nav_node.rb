class RoleNavNode < ActiveRecord::Base
  belongs_to :role
  belongs_to :nav_node
end
