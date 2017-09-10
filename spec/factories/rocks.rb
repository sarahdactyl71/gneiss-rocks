FactoryGirl.define do
  factory :rock do
    location_found Faker::Zelda.location
    description Faker::Hipster.paragraph
  end
end
