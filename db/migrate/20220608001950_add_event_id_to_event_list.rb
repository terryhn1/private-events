class AddEventIdToEventList < ActiveRecord::Migration[7.0]
  def change
    add_column :event_lists, :event_id, :integer
  end
end
