class CreateDueTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :due_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
