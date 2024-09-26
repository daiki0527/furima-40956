FactoryBot.define do
  factory :user do
    nickname           { Faker::Name.initials(max_length: 40) }
    email              { Faker::Internet.email }
    encrypted_password { Faker::Internet.password(min_length: 6) }
    last_name          { Faker::Name.last_name }
    first_name         { Faker::Name.first_name }
    last_name_kana     { Faker::Name.last_name }
    first_name_kana    { Faker::Name.first_name }
    birth              { Faker::Date.birthday }
  end
end
