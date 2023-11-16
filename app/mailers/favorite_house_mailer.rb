class FavoriteHouseMailer < ApplicationMailer
    #Send email to the owner of the house when a cliente mark as favorite
    def notify_house_owner
     @user = User.new
     @user.email = "testa@gmail.com" 
     debugger
     mail(to: "testa@gmail.com", subject: 'Welcome to My Awesome Site')
    end
end
