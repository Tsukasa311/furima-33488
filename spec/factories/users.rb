FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.name}
    email                   {Faker::Internet.free_email}
    password                {'1a' + Faker::Internet.password(min_length: 6) } 
    password_confirmation   {password}
    last_name               {Gimei.name}
    first_name              {Gimei.name}
    last_name_kana          {Gimei.name.katakana}
    first_name_kana         {Gimei.name.katakana}
    birthday                {Faker::Date.in_date_period}
  end
end
