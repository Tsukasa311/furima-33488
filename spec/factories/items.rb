FactoryBot.define do
  factory :item do
    title              {Faker::String.random}
    text               {Faker::String.random}
    category_id        {Faker::Number.between(from: 2, to: 11 )}
    state_id           {Faker::Number.between(from: 2, to: 7 )}
    burden_id          {Faker::Number.between(from: 2, to: 3 )}
    prefecture_id      {Faker::Number.between(from: 2, to: 48 )}
    day_id             {Faker::Number.between(from: 2, to: 4 )}
    charge             {Faker::Number.between(from: 300, to:9999999 )}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
