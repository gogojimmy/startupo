class AdminCategory < ActiveRecord::Base
  has_many :resource_admin_category_ships
  has_many :resources, :through => :resource_admin_category_ships
end
