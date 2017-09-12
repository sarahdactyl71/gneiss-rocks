require 'rails_helper'

RSpec.describe Rock, type: :model do
  it "is valid with all the attributes" do
    expect(Rock.new).to be_valid
  end

  xit "is not valid without an image attachment" do

  end

  xit "is not valid without a location found" do

  end

  xit "is not valid without a description" do

  end
end
