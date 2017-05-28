class AddCompletedToAssignments < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :completed, :boolean, default: false
  end
end
