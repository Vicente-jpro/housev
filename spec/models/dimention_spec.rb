require 'rails_helper'

RSpec.describe Dimention, type: :model do
  describe "model" do 
    let(:dimention) { create(:dimention) }

    it 'has dimention.' do 
      expect(dimention.nil?).to eq(false) 
    end

    it 'has dimention  with_d.' do 
      expect(dimention.with_d).to eq(10)
    end

    it 'has dimention height_d.' do 
      expect(dimention.height_d).to eq(10)
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

  describe "association" do 
    it { should have_one(:land) }
  end

end
