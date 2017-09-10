require 'rails-helper'

RSpec.describe "a user can navigate to rock show page" do
  it "they can see labels about the rock image" do
    visit root_path
    click_on "What Is This Rock?"

    expect(current_path).to eq(rock_path(rock.id))
    within(:css, "div#rock-labels") do
      expect(page).to have_selector('li', count: 5)
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
