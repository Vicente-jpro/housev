FactoryBot.define do
  factory :land do

    #Own attributes
    title_land { "Terreno no mato bem localizado" }
    description { "Este terreno tem leões para dar corrida no propretário do terreno." }
    price { 100000 }

    # Association
    dimention 
    address 
    
  end
end
