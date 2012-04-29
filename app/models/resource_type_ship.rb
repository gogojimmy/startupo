class ResourceTypeShip < ActiveRecord::Base
  belongs_to :resource, :foreign_key => :resource_id
  belongs_to :resource_type, :foreign_key => :resource_type_id
end
