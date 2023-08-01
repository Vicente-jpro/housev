class CreateDimentions < ActiveRecord::Migration[7.0]
  def change
    create_table :dimentions do |t|
      t.integer :with_d
      t.integer :height_id

      t.timestamps
    end
  end
end
