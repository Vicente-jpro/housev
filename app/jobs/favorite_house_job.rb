class FavoriteHouseJob < ApplicationJob
  queue_as :house_notification

  def perform(*args)
    puts "############## Testin my job###########"
    FavoriteHouseMailer.notify_house_owner.deliver_now
    
  end
end
