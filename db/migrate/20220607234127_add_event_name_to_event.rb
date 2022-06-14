class AddEventNameToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :event_name, :string
  end
end
