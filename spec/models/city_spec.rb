require 'rails_helper'

RSpec.describe City, type: :model do

  describe "model" do 
    let(:city) { create(:city) }

    it 'has a city' do 
       expect(city.nil?).to eq(false)
    end

    it 'has a province' do  
      expect(city.province.province_name).to eq("Luanda")
    end

  end

  describe "validation" do 
    let(:province) { create(:province) }

    before :context do 
      @city = City.new 
    end

    it 'has invalide city' do 
      expect { @city.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'has invalide city_name' do 
      @city.city_name = nil
      @province = Province.new 
      @province.province_name = "Luanda"
      @city.province = @province

      expect { @city.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'has invalide province' do
      @city.province = nil
      @city.city_name = "Kilamba"

      expect { @city.save! }.to raise_error(ActiveRecord::RecordInvalid) 
    end

    it { should validate_presence_of(:province) }
    it { should validate_presence_of(:city_name)}

  end

  describe "association" do 
    it { should belong_to(:province)}
    it { should have_many(:address)}
  end

end
