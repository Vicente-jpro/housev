class CreateProfileLands < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_lands do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :land, null: false, foreign_key: true

      t.timestamps
    end
  end
end
