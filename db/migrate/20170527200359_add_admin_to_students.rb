class AddAdminToStudents < ActiveRecord::Migration[5.0]
  def change
    add_reference :students, :admin, foreign_key: true
  end
end
