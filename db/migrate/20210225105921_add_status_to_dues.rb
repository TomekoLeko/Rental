class AddStatusToDues < ActiveRecord::Migration[6.0]
  def change
    add_column :dues, :status, :integer, :default => 0
  end
end
