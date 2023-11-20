class FavoriteHouseMailer < ApplicationMailer

    #Send email to the owner of the house when a cliente mark as favorite
    def notify_house_owner(owner_house, client, favorite_house)
        @owner_house = owner_house  
        @client = client 
        
        @url = "http://localhost:3000/houses/#{favorite_house.house_id}"
     mail(to: @owner_house.email, subject: "Cliente #{@client.name_profile} gostou seu imovel.")
    end
end
