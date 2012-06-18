class Event < ActiveRecord::Base
  has_many :assets
  has_many :images
  belongs_to :user
  has_many :join_event_attendee_ships
  has_many :attendees, :class_name => User, :through => :join_event_attendee_ships
  accepts_nested_attributes_for :assets, :allow_destroy => true
  accepts_nested_attributes_for :images, :allow_destroy => true

  geocoded_by :address
  validates_presence_of :name, :description, :address
  after_validation :geocode

  scope :available, where(["start_time > ?", Time.now])

  def join(user)
    JoinEventAttendeeShip.create!(:user_id => user.id, :event_id => self.id)
  end

  def first_image
    self.images.first.image
  end
end
