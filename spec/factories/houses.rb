FactoryBot.define do
  factory :house do
    room { 1 }
    title { 1 }
    living_room { 1 }
    bath_room { 1 }
    yeard { 1 }
    kitchen { 1 }
    balcony { 1 }
    condition { "MyString" }
    type_negotiation { "MyString" }
    price { 1 }
    garage { 1 }
    pool { 1 }
    discription { "MyString" }
    tipology { "MyString" }
    next_by { "MyString" }
    furnished { false }
    property_type { "MyString" }
    location { nil }
    address { nil }
    dimention { nil }
  end
end
