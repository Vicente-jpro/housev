class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.integer :room
      t.integer :title
      t.integer :living_room
      t.integer :bath_room
      t.integer :yeard
      t.integer :kitchen
      t.integer :balcony
      t.string :condition
      t.string :type_negotiation
      t.integer :price
      t.integer :garage
      t.integer :pool
      t.string :discription
      t.string :tipology
      t.string :next_by
      t.boolean :furnished
      t.string :property_type
      t.references :location, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.references :dimention, null: false, foreign_key: true

      t.timestamps
    end
  end
end
