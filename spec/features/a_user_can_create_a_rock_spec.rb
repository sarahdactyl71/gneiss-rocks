require 'rails-helper'

RSpec.describe "a user can create a rock" do
  it "sees all the attributes a rock has" do
    visit new_rock_path
    fill_in rock_location_found, with: "Boulder, CO"
    fill_in rock_description, with: "Conglomerate"
  end
end

# as a user
# when I visit the home page
# and I click on "create new rock"
# I expect my current path to be the new rock path
# I fill in location found with something
# I fill in description with something
# and I upload an image
# I click on create rock
# I expect my current path to be the rock index
# and I expect the page to have the location I submitted,
# the description I submitted,
# and the image I submitted
