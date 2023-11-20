class FavoriteHouseMailer < ApplicationMailer
    #Send email to the owner of the house when a cliente mark as favorite
    def notify_house_owner
        @owner_house = params[:owner_house]   
        @client = params[:client] 
        @url = params[:url]
     mail(to: @owner_house.email, subject: "Cliente #{@client.name_profile} gostou seu imovel.")
    end
end
