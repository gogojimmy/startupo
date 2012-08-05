#encoding: utf-8
class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :author, :class_name => 'User', :foreign_key => 'user_id'
  validates_presence_of :title, :content
  scope :public_posts, where(:status => "public")

  STATUS = { "public" => "公開", "draft" => "草稿", "closed" => "關閉" }
  validates_inclusion_of :status, :in => STATUS.keys
end
