class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.integer :longitude
      t.integer :latitude

      t.timestamps
    end
  end
end
