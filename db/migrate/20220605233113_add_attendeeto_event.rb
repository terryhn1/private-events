class AddAttendeetoEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :attendee_id
  end
end
