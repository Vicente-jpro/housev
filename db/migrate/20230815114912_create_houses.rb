class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.integer :room
      t.string :title
      t.integer :living_room, default: 0
      t.integer :bath_room, default: 0
      t.integer :yard, default: 0
      t.integer :kitchen, default: 0
      t.integer :balcony, default: 0
      t.integer :condition, default: 0
      t.integer :type_negotiation, default: 0
      t.decimal :price, precision: 8, scale: 2
      t.integer :garage, default: 0
      t.integer :pool, default: 0
      t.string :description
      t.integer :tipology, default: 0
      t.integer :next_by, default: 0
      t.boolean :furnished, default: true
      t.integer :property_type, default: 0
      t.references :location, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.references :dimention, null: false, foreign_key: true

      t.timestamps
    end
  end
end
