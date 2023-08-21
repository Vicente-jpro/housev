require "rails_helper"

RSpec.describe FavoriteHousesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/favorite_houses").to route_to("favorite_houses#index")
    end

    it "routes to #new" do
      expect(get: "/favorite_houses/new").to route_to("favorite_houses#new")
    end

    it "routes to #show" do
      expect(get: "/favorite_houses/1").to route_to("favorite_houses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/favorite_houses/1/edit").to route_to("favorite_houses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/favorite_houses").to route_to("favorite_houses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/favorite_houses/1").to route_to("favorite_houses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/favorite_houses/1").to route_to("favorite_houses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/favorite_houses/1").to route_to("favorite_houses#destroy", id: "1")
    end
  end
end
