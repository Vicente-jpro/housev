class CreateDimentions < ActiveRecord::Migration[7.0]
  def change
    create_table :dimentions do |t|
      t.integer :width_d
      t.integer :height_d

      t.timestamps
    end
  end
end
