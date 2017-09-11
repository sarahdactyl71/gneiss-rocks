FactoryGirl.define do
  factory :rock do
    location_found Faker::Zelda.location
    description Faker::Hipster.paragraph
    image_file_name "other_rock.JPG"
  end
end
