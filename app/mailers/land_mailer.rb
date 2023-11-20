class LandMailer < ApplicationMailer


  def publisher(client_name, client_email, client_message, owner_land, land)
    @client_name = client_name 
    @client_email = client_email 
    @client_message = client_message
   
    @owner_land = owner_land
    @url = "http://localhost:3000/lands/#{land.id}"
    mail(to: @owner_land.email, subject: "Tens um cliente intereçado pelo seu terreno.")
  end
end
