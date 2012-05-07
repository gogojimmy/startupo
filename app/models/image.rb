class Image < ActiveRecord::Base
  belongs_to :event

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_presence :image
end
