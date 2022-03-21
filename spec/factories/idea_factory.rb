MONTH_DAYS = 30

FactoryBot.define do
  factory :idea do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    problem { Faker::Lorem.paragraph }
    sphere { Faker::Lorem.sentence }
    geo_focus { Faker::Lorem.sentence(word_count: 1) }
    investor_requirements { Faker::Lorem.paragraph }
    team { Faker::Lorem.paragraph }
    next_steps { Faker::Lorem.paragraph }
    customer { Customer.last }
    publication_period { Date.today + MONTH_DAYS }     
  end
end