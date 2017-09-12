require 'rails_helper'

RSpec.describe Rock, type: :model do
  it "is valid with all the attributes" do
    rock = create(:rock)
    expect(rock).to be_valid
    expect(Rock.new).to_not be_valid
  end

  it "is not valid without a location found" do
    rock = build(:rock, location_found: nil)
    expect(rock).to_not be_valid
  end

  it "is not valid without a description" do
    rock = build(:rock, description: nil)
    expect(rock).to_not be_valid
  end
end
