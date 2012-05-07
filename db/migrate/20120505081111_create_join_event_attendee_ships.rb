class CreateJoinEventAttendeeShips < ActiveRecord::Migration
  def change
    create_table :join_event_attendee_ships do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
    add_index :join_event_attendee_ships, :event_id
    add_index :join_event_attendee_ships, :user_id
  end
end
