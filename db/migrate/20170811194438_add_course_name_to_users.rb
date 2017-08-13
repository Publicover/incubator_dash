class AddCourseNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :course_name, :string
  end
end
