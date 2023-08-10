require 'rails_helper'

RSpec.describe Address, type: :model do
  
  describe "model" do 
    let(:address) { create(:address) }

    it 'has a street' do 
      expect(address.street).to  eq("Bloco K") 
    end

    it 'has a province' do 
      expect(address.city.province.province_name).to eq("Luanda")
    end

    it 'has a city' do 
      expect(address.city.city_name).to eq("Kilamba")
    end

    before :context do  
      @province = Province.new 
      @city = City.new 
      @city.province = @province

      @address = Address.new
      @address.city = @city
    end

    it 'does not have an address' do
      expect(@address.nil?).to eq(false)
    end

    it 'does not have a street' do 
      expect(@address.street).to eq(nil)
    end

    it 'does not have a province' do 
      expect(@address.city.province.province_name).to eq(nil)
    end

    it 'does not have a city' do 
      expect(@address.city.city_name).to eq(nil)
    end
  end


  describe "validations" do
    before :context do 
      @address = Address.new 
    end

    let(:address) { create(:address) }
    it 'has invalide address' do  
      expect { Address.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'has invalide street' do       
      @address.city = address.city
      @address.city.province = address.city.province
      expect { @address.save! }.to raise_error(ActiveRecord::RecordInvalid) 
    end

    it 'has invalide city' do 
      @address.street = address.street
      @address.city = nil
      expect { @address.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:city) }

  end

  describe "association" do 
    it { should belong_to(:city) }
    it { should have_one(:profile)}
    it { should have_one(:land)}
  end

end
