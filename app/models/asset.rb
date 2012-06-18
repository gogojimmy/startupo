class Asset < ActiveRecord::Base
  belongs_to :event

  has_attached_file :file

  validates_attachment_presence :file
end
