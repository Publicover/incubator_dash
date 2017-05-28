class RemoveCompletedFromAssignments < ActiveRecord::Migration[5.0]
  def change
    remove_column :assignments, :completed, :boolean
  end
end
