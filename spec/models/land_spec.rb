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
    
    it 'has dimention  width_d.' do 
      expect(land.dimention.width_d).to eq(10)
    end
    
    it 'has dimention height_d.' do 
      expect(land.dimention.height_d).to eq(10)
    end

    it 'has an address.' do 
      expect(land.address.nil?).to eq(false)
    end


    it 'has an address street.' do 
      expect(land.address.street).to eq("Bloco K")
    end


    it 'has an address city.' do 
      expect(land.address.city.nil?).to eq(false)
    end


    it 'has an address city_name.' do 
      expect(land.address.city.city_name).to eq("Kilamba")
    end


    it 'has an address province.' do 
      expect(land.address.city.province.nil?).to eq(false)
    end

    it 'has an address province_name.' do 
      expect(land.address.city.province.province_name).to eq("Luanda")
    end

  end

  describe "validation" do 
    before :context do 

      @invalid_land = Land.new
      begin
        @invalid_land.save!
      rescue => exception
        @invalid_land =  @invalid_land.errors.messages
      end
      

      @dimention = Dimention.new
      @dimention.width_d = 10
      @dimention.height_d = 10

      @city = City.new 
      @city.city_name = "Bloco K"
      
      @address = Address.new 
      @address.street = "Bloco K"
      @address.city = @city
      
      @province = Province.new 
      @province.province_name = "Luanda"
      @address.city.province = @province

      @land = Land.new
      @land.address = @address
      @land.dimention = @dimention
      
    end

    it 'has invalid land address.' do 
      expect(@invalid_land[:address][0]).to eq("must exist")
    end

    it 'has invalide land description.' do
      expect(@invalid_land[:description][0]).to eq("can't be blank")
    end
    
    it 'has invalide land dimention.' do 
      expect(@invalid_land[:dimention][0]).to eq("must exist")
    end
    
    it 'has invalide land privece.' do 
      expect(@invalid_land[:price][0]).to eq("can't be blank")
    end

    it 'has invalide land privece.' do 
      expect(@invalid_land[:title_land][0]).to eq("can't be blank")
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










