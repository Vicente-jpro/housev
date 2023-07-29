FactoryBot.define do
  factory :profile do
    name_profile { "MyString" }
    phone1 { "MyString" }
    phone2 { "MyString" }
    profile_type { "MyString" }
    user { nil }
  end
end
