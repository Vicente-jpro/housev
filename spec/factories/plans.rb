FactoryBot.define do
  factory :plan do
    name_plans { "MyString" }
    price { 1 }
    description { "MyText" }
    activated { false }
    first_time { false }
  end
end
