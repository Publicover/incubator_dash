class CreateJoinTableAssignmentUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :assignments, :users do |t|
      # t.index [:assignment_id, :user_id]
      # t.index [:user_id, :assignment_id]
    end
  end
end
