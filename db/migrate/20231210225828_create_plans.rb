class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name_plans
      t.integer :price
      t.text :description
      t.boolean :activated
      t.boolean :first_time

      t.timestamps
    end
  end
end
