class RemoveAttendeeIdFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :attendee_id, :integer
  end
end
