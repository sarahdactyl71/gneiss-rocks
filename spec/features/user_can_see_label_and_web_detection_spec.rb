require 'rails_helper'

RSpec.describe "a user can navigate to rock show page" do
  it "they can see labels about the rock image" do
    visit new_rock_path
    fill_in 'Location found', with: "Boulder, CO"
    fill_in 'Description', with: "Conglomerate"
    attach_file("Image", Rails.root + "spec/fixtures/rock.jpg")
    click_on "Create Rock"
    click_on "What Is This Rock?"

    expect(current_path).to eq(rock_path(Rock.first.id))
    within(:css, "div#rock-labels") do
      expect(page).to have_selector('li', count: 8)
    end
    expect(page).to have_content("Rock")
  end

  it "they can see web detection about rock image" do
    visit new_rock_path
    fill_in 'Location found', with: "Boulder, CO"
    fill_in 'Description', with: "Conglomerate"
    attach_file("Image", Rails.root + "spec/fixtures/rock.jpg")
    click_on "Create Rock"
    click_on "What Is This Rock?"

    expect(current_path).to eq(rock_path(Rock.first.id))
    within(:css, "div#web_detection") do
      expect(page).to have_selector('li', count: 30)
    end
    expect(page).to have_content("Rock")
  end
end

# As a user
# when I visit root path
# and I click on "find out about this rock"
# I am directed to the rocks show page
# and a google label detection has been run
# I expect the page to have 5 or more labels
# i expect the page to have the word "Rock"
