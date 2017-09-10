require 'rails-helper'

RSpec.describe "a user can navigate to rock show page" do
  it "they can see labels about the rock image" do
    visit root_path
    
  end
end

# As a user
# when I visit root path
# and I click on "find out about this rock"
# I am directed to the rocks show page
# and a google label detection has been run
# I expect the page to have 5 or more labels
# i expect the page to have the word "Rock"
