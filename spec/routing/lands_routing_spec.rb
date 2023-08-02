require "rails_helper"

RSpec.describe LandsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lands").to route_to("lands#index")
    end

    it "routes to #new" do
      expect(get: "/lands/new").to route_to("lands#new")
    end

    it "routes to #show" do
      expect(get: "/lands/1").to route_to("lands#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/lands/1/edit").to route_to("lands#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lands").to route_to("lands#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lands/1").to route_to("lands#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lands/1").to route_to("lands#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lands/1").to route_to("lands#destroy", id: "1")
    end
  end
end
