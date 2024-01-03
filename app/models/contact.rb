class Contact < ApplicationRecord
    attr_accessor :house_id, :land_id
    validates_presence_of :cliente_name, :email_cliente, :message
end
