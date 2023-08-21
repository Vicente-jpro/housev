class CreateFavoriteHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_houses do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
