class ResourceAdminCategoryShip < ActiveRecord::Base
  belongs_to :resource
  belongs_to :admin_category
end
