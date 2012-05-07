class JoinEventAttendeeShip < ActiveRecord::Base
  belongs_to :attendee, :foreign_key => :user_id
  belongs_to :join_event, :foreign_key => :event_id
end
