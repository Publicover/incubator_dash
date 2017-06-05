class AddFileToHomework < ActiveRecord::Migration[5.0]
  def change
    add_attachment :homeworks, :document
  end
end
