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

  describe '#create' do
    it "creates a rock" do
      rock = create(:rock)
      post '/api/v1/rocks', params: {rock: {location_found: rock.location_found, description: rock.description, image: rock.image.path}}

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(Rock.last.location_found).to eq(rock.location_found)
      expect(Rock.last.description).to eq(rock.description)
    end

    it "will not create a rock with a missing field" do
      rock = create(:rock)
      post '/api/v1/rocks', params: {rock: {location_found: rock.location_found}}

      json = JSON.parse(response.body)

      expect(response.status).to eq(400)
    end
  end

  describe '#update' do
    it "updates a rock" do
      rock = create(:rock)
      patch "/api/v1/rocks/#{rock.id}", params: {rock: {location_found: "Oregon", description: "There are trees"}}
        find_rock = Rock.find(rock.id)

        json = JSON.parse(response.body)
        expect(response).to be_success
        expect(find_rock.location_found).to eq("Oregon")
        expect(find_rock.description).to eq("There are trees")
    end

    it "will not update the rock without the right attributes" do
      rock = create(:rock)
      patch "/api/v1/rocks/#{rock.id}", params: {rock: {location_found: ""}}

      json = JSON.parse(response.body)
      expect(response.status).to eq(400)
    end
  end


end
