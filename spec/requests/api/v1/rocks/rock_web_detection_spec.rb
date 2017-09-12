require 'rails_helper'

describe "Rock Web Detection API" do
  it "returns a list of scores and descriptions associated with web detection"
    visit new_rock_path
    fill_in 'Location found', with: "Boulder, CO"
    fill_in 'Description', with: "Conglomerate"
    attach_file("Image", Rails.root + "spec/fixtures/rock.jpg")
    click_on "Create Rock"

    get "/api/v1/rocks/#{rock.id}/web_detection"

    expect(response).to be_success
  end
end
