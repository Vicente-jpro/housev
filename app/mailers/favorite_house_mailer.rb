class FavoriteHouseMailer < ApplicationMailer
    #Send email to the owner of the house when a cliente mark as favorite
    def notify_house_owner
        @owner_house = params[:owner_house]   
        @client = params[:client] 
        @url = params[:url]
        ARTIGO = (@client.MASCULINE?) ? "O" : "A"
     mail(to: @owner_house.email, subject: "#{ARTIGO} cliente #{@client.name_profile} gostou seu imovel.")
    end
end
