class RemoveActivationFromStudents < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :activation_digest, :string
    remove_column :students, :activated, :boolean
    remove_column :students, :activated_at, :datetime
  end
end
