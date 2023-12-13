FactoryBot.define do
  factory :plans_selected do
    day_used { 1 }
    duration { 1 }
    plans { nil }
    user { nil }
  end
end
