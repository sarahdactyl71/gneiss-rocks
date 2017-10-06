require 'rails_helper'

describe "a user can be created" do
  it "when user goes to new user path" do
    visit new_user_path
    fill_in "Email", with: "finn@landofooo.com"
    fill_in "Username", with: "Finn the Human"
    fill_in "Password", with: "password"

    click_on "Create Account"
    expect(page).to have_content("Welcome Finn the Human")
  end
end
