require 'rails_helper'

RSpec.describe Address, type: :model do
  
  describe "model" do 
    let(:address) { create(:address) }
    
    it 'do not has a nill address' do
      expect(address.nil?).to eq(false) 
    end 

    it 'has a street' do 
      expect(address.street).to  eq("Bloco K")  
    end

    it 'has a province' do 
      except(address.city.province.province_name).to eq('Luanda')
    end

    it 'has a city' do 
      expect(address.city.city_name).to eq('Kilamba')
    end

    before :context do 
      @address = Address.new 
    end

    it 'does not have an address' do
      except(@address.nil).to eq(true)
    end

    it 'does not have a street' do 
      except(@address.street).to eq(nil)
    end

    it 'does not have a province' do 
      expect(@address.city.province.province_name).to eq(nil)
    end

    it 'does not have a city' do 
      except(@address.city.city_name).to eq(nil)
    end
    
  end

end
