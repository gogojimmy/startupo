class Resource < ActiveRecord::Base
  belongs_to :user
  has_many :resource_type_ships
  has_many :resource_types, :through => :resource_type_ships
end
