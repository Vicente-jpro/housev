class FavoriteHouseJob < ApplicationJob
  queue_as :house_notification

  def perform(*args)
    puts "############## Testin my job###########"
  end
end
