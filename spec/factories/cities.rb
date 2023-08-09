FactoryBot.define do
  factory :city do
    #Association
    province

    #Own attribute
    city_name { "kilamba" }
    
  end
end
