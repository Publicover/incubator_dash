class CreateHomeworks < ActiveRecord::Migration[5.0]
  def change
    create_table :homeworks do |t|
      t.string :title
      t.integer :user_id
      t.integer :assignment_id

      t.timestamps
    end
    add_index :homeworks, :user_id
    add_index :homeworks, :assignment_id
  end
end
