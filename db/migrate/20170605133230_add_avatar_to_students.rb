class AddAvatarToStudents < ActiveRecord::Migration[5.0]
  def change
    add_attachment :students, :avatar
  end
end
