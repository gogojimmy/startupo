class CooperateWay < ActiveRecord::Base
  has_many :resource_cooperate_way_ships
  has_many :resources, :through => :resource_cooperate_way_ships
  validates_uniqueness_of :name
end
