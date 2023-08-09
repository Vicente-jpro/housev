FactoryBot.define do
  factory :city do
    #Association
    province

    #Own attribute
    city_name { "Kilamba" }
    
  end
end
