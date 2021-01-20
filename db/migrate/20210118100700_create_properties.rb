class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :postcode
      t.string :city
      t.boolean :rented

      t.timestamps
    end
  end
end
