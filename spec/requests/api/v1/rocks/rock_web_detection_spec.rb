require 'rails_helper'

describe "Rock Web Detection API" do
  it "returns a list of scores and descriptions associated with web detection" do
    rock = create(:rock)

    get "/api/v1/rocks/#{rock.id}/web_detection"

    expect(response).to be_success
  end
end
