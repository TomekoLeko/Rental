class CreateDues < ActiveRecord::Migration[6.0]
  def change
    create_table :dues do |t|
      t.integer :due_type_id
      t.integer :agreement_id
      t.integer :property_id
      t.integer :tenant_id
      t.date :period_from
      t.date :period_to
      t.float :amount
      t.float :paid_amount, :default => 0.0
      t.date :paid_on
      t.date :payment_date
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
