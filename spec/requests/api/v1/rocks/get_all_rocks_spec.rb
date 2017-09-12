require 'rails_helper'

describe "Rocks API" do
  it "returns all the rocks in the database" do
    rocks = create_list(:rock, 3)

    get "/api/v1/rocks"

    JSON.parse(response.body)

    expect(response).to be_success
  end

  it "shows a single rock" do
    rocks = create_list(:rock, 3)
    rock = rocks.first

    get "/api/v1/items/#{rock.id}"

    expect(response).to be_success
  end
end
