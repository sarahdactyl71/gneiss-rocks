require 'rails_helper'

describe "Rocks API" do

  describe "#index" do
    it "returns all the rocks in the database" do
      rocks = create_list(:rock, 3)

      get "/api/v1/rocks"

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json.length).to eq(3)
    end
  end

  describe '#show' do
    it "shows a single rock" do
      rocks = create_list(:rock, 3)
      rock = rocks.first

      get "/api/v1/rocks/#{rock.id}"

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json["id"]).to eq(rock.id)
      expect(json["location_found"]).to eq(rock.location_found)
      expect(json["description"]).to eq(rock.description)
    end

    it "returns an error if there is no id" do
      get "/api/v1/rocks/0"

      json = JSON.parse(response.body)
      
      expect(response.status).to eq(404)
    end
  end


end
