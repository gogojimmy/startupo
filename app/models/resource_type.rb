class ResourceType < ActiveRecord::Base
  has_many :resource_type_ships
  has_many :resources, :through => :resource_type_ships
  validates_presence_of :name, :description
end
