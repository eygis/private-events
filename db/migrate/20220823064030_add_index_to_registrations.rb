class AddIndexToRegistrations < ActiveRecord::Migration[7.0]
  def change
    add_index :registrations,[:user_id, :event_id]
  end
end
