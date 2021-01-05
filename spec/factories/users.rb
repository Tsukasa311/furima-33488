FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.name}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6 , mix_case: true) } 
    password_confirmation   {password}
    last_name               {Faker::Name.last_name}
    first_name              {Faker::Name.first_name}
    last_name_kana          {Gimei.name.katakana}
    first_name_kana         {Gimei.name.katakana}
    birthday                {Faker::Date.in_date_period}
  end
end
