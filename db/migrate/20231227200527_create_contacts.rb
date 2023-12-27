class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :cliente_name
      t.string :whatsapp
      t.string :email_cliente
      t.string :message

      t.timestamps
    end
  end
end
