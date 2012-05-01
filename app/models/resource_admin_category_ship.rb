class ResourceAdminCategoryShip < ActiveRecord::Base
  belongs_to :resource
  belongs_to :resource_admin_category
end
