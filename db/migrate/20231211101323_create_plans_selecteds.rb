class CreatePlansSelecteds < ActiveRecord::Migration[7.0]
  def change
    create_table :plans_selecteds do |t|
      t.integer :day_used, default: 0
      t.integer :duration
      t.boolean :activated, default: false 
      t.boolean :first_time, default: false
      t.references :plan, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
