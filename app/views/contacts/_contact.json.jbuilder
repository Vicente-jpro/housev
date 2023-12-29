json.extract! contact, :id, :cliente_name, :whatsapp, :email_cliente, :message, :created_at, :updated_at
json.url contact_url(contact, format: :json)
