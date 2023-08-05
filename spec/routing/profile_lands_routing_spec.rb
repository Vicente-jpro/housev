require "rails_helper"

RSpec.describe ProfileLandsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/profile_lands").to route_to("profile_lands#index")
    end

    it "routes to #new" do
      expect(get: "/profile_lands/new").to route_to("profile_lands#new")
    end

    it "routes to #show" do
      expect(get: "/profile_lands/1").to route_to("profile_lands#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/profile_lands/1/edit").to route_to("profile_lands#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/profile_lands").to route_to("profile_lands#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/profile_lands/1").to route_to("profile_lands#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/profile_lands/1").to route_to("profile_lands#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/profile_lands/1").to route_to("profile_lands#destroy", id: "1")
    end
  end
end
