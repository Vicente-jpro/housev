class AddGenderToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :gender, :integer, default: 0
  end
end
