class ResourceCooperateWayShip < ActiveRecord::Base
  belongs_to :resource, :foreign_key => :resource_id
  belongs_to :cooperate_way, :foreign_key => :cooperate_way_id
end
