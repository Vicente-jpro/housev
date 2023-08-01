class AddAddressToProfile < ActiveRecord::Migration[7.0]
  def change
    add_reference :profiles, :address, null: false, foreign_key: true
  end
end
