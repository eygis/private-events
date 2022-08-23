class RemoveIndexFromRegistrations < ActiveRecord::Migration[7.0]
  def change
    remove_index :registrations,[:user_id, :event_id]
  end
end
