require 'rails_helper'

describe "rock label detection endpoint" do
  it "returns a list of labels dependent upon the rock" do
    rock = create(:rock)

    get "/api/v1/rocks/#{rock.id}/label_detection"

    expect(response).to be_success
  end
end
