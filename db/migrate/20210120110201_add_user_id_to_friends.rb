class AddUserIdToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :user_id, :integer
    add_index :properties, :user_id
  end
end
