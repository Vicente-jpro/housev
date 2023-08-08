require "rails_helper"

RSpec.describe FavoriteLandsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/favorite_lands").to route_to("favorite_lands#index")
    end

    it "routes to #new" do
      expect(get: "/favorite_lands/new").to route_to("favorite_lands#new")
    end

    it "routes to #show" do
      expect(get: "/favorite_lands/1").to route_to("favorite_lands#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/favorite_lands/1/edit").to route_to("favorite_lands#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/favorite_lands").to route_to("favorite_lands#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/favorite_lands/1").to route_to("favorite_lands#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/favorite_lands/1").to route_to("favorite_lands#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/favorite_lands/1").to route_to("favorite_lands#destroy", id: "1")
    end
  end
end
