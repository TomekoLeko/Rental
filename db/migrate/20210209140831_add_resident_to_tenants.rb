class AddResidentToTenants < ActiveRecord::Migration[6.0]
  def change
    add_column :tenants, :resident, :boolean, :default => false
  end
end
