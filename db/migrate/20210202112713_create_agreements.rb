class CreateAgreements < ActiveRecord::Migration[6.0]
  def change
    create_table :agreements do |t|
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
    add_index :agreements, :property_id
    add_index :agreements, :tenant_id
    add_index :agreements, :user_id
  end
end
