require 'rails_helper'

RSpec.describe Dimention, type: :model do
  describe "model" do 
    let(:dimention) { create(:dimention) }

    it 'has dimention.' do 
      expect(dimention.nil?).to eq(false) 
    end

    it 'has dimention  width_d.' do 
      expect(dimention.width_d).to eq(10)
    end

    it 'has dimention height_d.' do 
      expect(dimention.height_d).to eq(10)
    end

  end 

  describe "validation" do 
    before :context do 
      @dimention = Dimention.new
    end
    
    it 'has invalide dimention width_d and height_d.' do 
      expect(@dimention.save).to eq(false)
    end

    it 'has invalide width_d.' do 
      @dimention.width_d = 0
      @dimention.height_d = 0

        begin
          @dimention.save!
        rescue => exception
          expect(@dimention.errors.messages[:width_d][0]).to eq("must be greater than 5")
          expect(@dimention.errors.messages[:height_d][0]).to eq("must be greater than 5")
        end
     end

  end


  describe "association" do 
    it { should have_one(:land) }
  end

end
