class CreatePlansSelecteds < ActiveRecord::Migration[7.0]
  def change
    create_table :plans_selecteds do |t|
      t.integer :day_used
      t.integer :duration
      t.references :plans, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
