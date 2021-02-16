class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.date :from
      t.date :to
      t.date :payment_date
      t.float :rent
      t.float :deposit
      t.integer :property_id
      t.integer :tenant_id
      t.integer :user_id

      t.timestamps
    end
    add_index :rents, :property_id
    add_index :rents, :tenant_id
    add_index :rents, :user_id
  end
end
