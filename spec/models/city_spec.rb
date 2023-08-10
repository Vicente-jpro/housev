require 'rails_helper'

RSpec.describe City, type: :model do
  describe "City" do 
    let(:city) { create(:city) }


    it { should validate_presence_of(:province) }

    it 'has a city' do 
       
    end

    it 'has a province' do  
    end

  end

  describe "validation" do 

    before :context do 
      @address = Address.new 
    end

    it 'has invalide city_name' do 
    end

    it 'has invalide province' do 
    end

  end
end
