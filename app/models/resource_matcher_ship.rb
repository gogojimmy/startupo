#encoding: utf-8
class ResourceMatcherShip < ActiveRecord::Base
  belongs_to :match_resource, :foreign_key => :resource_id
  belongs_to :matcher, :foreign_key => :user_id

  STATUS = { 'contacting' => '聯絡中', 'matched' => '已媒合', 'pending' => '待查' }

  validates_inclusion_of :status, :in => STATUS.keys
end
