class Contact < ApplicationRecord
    validates_presence_of :cliente_name, :email_cliente, :message
end
