class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.boolean :completed, :default => false

      t.timestamps
    end
  end
end
