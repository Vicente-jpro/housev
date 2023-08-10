require 'rails_helper'

RSpec.describe Land, type: :model do
  
  describe "model" do 
    let(:land) { create(:land) }


    it 'has a land' do 
      expect(land.nil?).to eq(false)
    end

    it 'has a title_land.' do 
      expect(land.title_land).to eq("Terreno no mato bem localizado")
    end

    it 'has a description.' do 
      expect(land.description).to eq("Este terreno tem leões para dar corrida no propretário do terreno.")
    end

    it 'has a price.' do
      expect(land.price).to eq(100000)
    end 

    it 'has a dimention.' do 
      expect(land.dimention.nil?).to eq(false)
    end
    
    it 'has dimention  with_d.' do 
      expect(land.dimention.with_d).to eq(10)
    end
    
    it 'has dimention height_d.' do 
      expect(land.dimention.height_d).to eq(10)
    end

    it 'has an address.' do 
    end

  end

  describe "validation" do 
    before :context do 
      @dimention = Dimention.new
    end
    
    it 'has invalide dimention.' do 
      expect(@dimention.save!).to raise_error(ActiveRecord::RecordInvalid)
    end
    
    it 'has invalide with_d.' do 
      @dimention.width_d = nil 
      expect(@dimention.save!).to raise_error(ActiveRecord::RecordInvalid)
    end
    
    it 'has invalide height_d.' do 
      @dimention.height_d = nil
      expect(@dimention.save!).to raise_error(ActiveRecord::RecordInvalid)
    end
  end

end



