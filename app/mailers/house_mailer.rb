class HouseMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.house_mailer.publisher.subject
  #
  def publisher(client_name, client_email, client_message, owner_house, house)
    @client_name = client_name 
    @client_email = client_email 
    @client_message = client_message
   
    @owner_house = owner_house
    @url = "http://localhost:3000/houses/#{house.id}"
    mail(to: @owner_house.email, subject: "Tens um cliente intereçado pelo seu imóvel.")
  end
end
