require 'rails_helper'

RSpec.describe "/lands", type: :request do

  let(:valid_attributes) {
    {
      title_land: "", 
      :description, 
      :price, 
      :dimention_id, 
      address_attributes: [:id, :street, :city_id, :_destroy],
      dimention_attributes: [:id, :width_d, :height_d, :_destroy ]
   #   images: []
  }
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Land.create! valid_attributes
      get lands_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      land = Land.create! valid_attributes
      get land_url(land)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_land_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      land = Land.create! valid_attributes
      get edit_land_url(land)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Land" do
        expect {
          post lands_url, params: { land: valid_attributes }
        }.to change(Land, :count).by(1)
      end

      it "redirects to the created land" do
        post lands_url, params: { land: valid_attributes }
        expect(response).to redirect_to(land_url(Land.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Land" do
        expect {
          post lands_url, params: { land: invalid_attributes }
        }.to change(Land, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post lands_url, params: { land: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested land" do
        land = Land.create! valid_attributes
        patch land_url(land), params: { land: new_attributes }
        land.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the land" do
        land = Land.create! valid_attributes
        patch land_url(land), params: { land: new_attributes }
        land.reload
        expect(response).to redirect_to(land_url(land))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        land = Land.create! valid_attributes
        patch land_url(land), params: { land: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested land" do
      land = Land.create! valid_attributes
      expect {
        delete land_url(land)
      }.to change(Land, :count).by(-1)
    end

    it "redirects to the lands list" do
      land = Land.create! valid_attributes
      delete land_url(land)
      expect(response).to redirect_to(lands_url)
    end
  end
end
