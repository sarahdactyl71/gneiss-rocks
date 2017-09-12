require 'rails_helper'

describe "get all the rocks" do
  it "returns all the rocks in the database" do
    create(:rock, location_found: "Boulder")
    create(:rock, location_found: "Denver")
    create(:rock, location_found: "Santa Fe")

    get "/api/v1/rocks/all"

    JSON.parse(response.body)

    expect(response).to be_success
  end
end
