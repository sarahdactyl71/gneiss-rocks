require 'rails_helper'

RSpec.describe "a user can create a rock" do
  it "sees all the attributes a rock has" do
    visit new_rock_path
    fill_in 'Location found', with: "Boulder, CO"
    fill_in 'Description', with: "Conglomerate"
    attach_file("Image", Rails.root + "spec/fixtures/rock.jpg")
    click_on "Create Rock"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Boulder, CO")
    expect(page).to have_content("Conglomerate")
    expect(page).to have_selector("img")
  end
end
