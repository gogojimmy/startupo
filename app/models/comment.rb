class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource
  validates_presence_of :content
  delegate :name, :to => :user, :allow_nil => true, :prefix => true
  default_scope :order => 'created_at desc'
end
