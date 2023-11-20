class HouseMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.house_mailer.publisher.subject
  #
  def publisher(params, owner_house)
    @client_name = params[:client_name] 
    @client_email = params[:client_email] 
    @client_message = params[:client_message]
   
    @owner_house = owner_house
  
    mail(to: @owner_house.email, subject: "Tens um cliente intereçado pelo seu imóvel.")
  end
end
