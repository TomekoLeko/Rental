class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|
      t.string :email
      t.string :name
      t.string :phone 

      t.timestamps
    end
  end
end
