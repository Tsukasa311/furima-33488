FactoryBot.define do
  factory :order_item do
    postcode        {Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s}
    prefecture_id   {Faker::Number.between(from: 2, to: 48 )}
    city            {Faker::Address.city}
    block           {Faker::Address.street_name}
    building        {Faker::Address.building_number}
    phone_number    {Faker::Number.number(digits: 11)}
    token           {Faker::String.random}
  end
end
