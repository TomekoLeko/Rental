class ChangeColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :properties, :rented, :boolean, :default => false
  end
end
