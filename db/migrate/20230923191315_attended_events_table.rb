class AttendedEventsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :attended_events do |t|
      t.references :attendee, foreign_key: { to_table: :users }
      t.references :event, foreign_key: { to_table: :events }

      t.timestamps
    end
  end
end
