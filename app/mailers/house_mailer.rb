class HouseMailer < ApplicationMailer

  def publisher(client_name, client_email, client_message, whatsapp, owner_house, house)
    @client_name = client_name 
    @client_email = client_email 
    @client_message = client_message
    @whatsapp = whatsapp
   
    @owner_house = owner_house
    @url = "http://localhost:3000/houses/#{house.id}"
    mail(to: @owner_house.email, subject: "Tens um cliente intereçado pelo seu imóvel.")
  end
  
end
