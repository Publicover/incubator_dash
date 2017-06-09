class AddAvatarToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_attachment :admins, :avatar
  end
end
