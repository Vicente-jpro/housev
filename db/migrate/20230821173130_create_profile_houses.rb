class CreateProfileHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_houses do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
