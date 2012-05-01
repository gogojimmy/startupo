class Resource < ActiveRecord::Base
  belongs_to :user
  has_many :resource_type_ships
  has_many :resource_types, :through => :resource_type_ships
  has_many :resource_cooperate_way_ships
  has_many :cooperate_ways, :through => :resource_cooperate_way_ships
  has_many :resource_admin_category_ships
  has_many :admin_categories, :through => :resource_admin_category_ships

end
