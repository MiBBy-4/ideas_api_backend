FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }
    password { 'testpassword' }
    password_confirmation { 'testpassword' }
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    skype { Faker::Internet.username }
  end
end