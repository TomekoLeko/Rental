class CreateDues < ActiveRecord::Migration[6.0]
  def change
    create_table :dues do |t|
      t.integer :due_type_id
      t.integer :rent_id
      t.integer :property_id
      t.integer :tenant_id
      t.date :period_from
      t.date :period_to
      t.float :amount
      t.float :paid_amount
      t.date :paid_at
      t.date :payment_date

      t.timestamps
    end
  end
end
