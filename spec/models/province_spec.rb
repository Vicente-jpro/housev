require 'rails_helper'

RSpec.describe Province, type: :model do
  describe "model" do  
    let(:province) { create(:province) }
    
    it 'has a province.' do 
      expect(province.nil?).to eq(false)
    end

    it 'has a province_name.' do 
      expect(province.province_name).to eq("Luanda")
    end
  end

  describe "validation" do 

    before :context do 
      @province = Province.new
    end

    it 'has invalid province.' do   
      expect { @province.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'has invalid province_name.' do 
      @province.province_name = nil
      expect { @province.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it { should validate_presence_of(:province_name) }
  end

  describe "association" do 
    it { should have_many(:cities) }
  end

end
