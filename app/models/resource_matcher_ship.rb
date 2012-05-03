class ResourceMatcherShip < ActiveRecord::Base
  belongs_to :match_resource, :foreign_key => :resource_id
  belongs_to :matcher, :foreign_key => :user_id
end
