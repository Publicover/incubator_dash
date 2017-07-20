class AddPasswordResetToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :password_reset_token, :string
    add_column :students, :password_reset_send_at, :datetime
  end
end
