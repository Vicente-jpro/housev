FactoryBot.define do
  factory :address do
    ## Associations 
    association :city

    ## Own attributes
    street { "Bloco K" }
    
  end
end
