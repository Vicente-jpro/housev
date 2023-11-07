class House < ApplicationRecord
  begin
    include EnumsConcerns
  
  rescue => exception
    
  end
  
  belongs_to :location
  accepts_nested_attributes_for :location

  belongs_to :dimention
  accepts_nested_attributes_for :dimention

  belongs_to :address
  accepts_nested_attributes_for :address

  has_many_attached :house_images
  
  has_many :profile_houses, dependent: :destroy
  has_many :profiles, through: :profile_houses
  has_many :favorite_houses, dependent: :destroy

  validates_presence_of :address, :dimention, :price, :title, :description, :house_images

  def self.find_houses_by_user(user)
    House.joins(:profiles)
        .where("profiles.user_id = #{user.id}")
        .order(id: :desc)
  end
  
  def self.find_house_by_user(user, house)
    House.joins(:profiles)
        .where("profiles.user_id = #{user.id} and houses.id = #{house.id}")
        .order(id: :desc)
  end

  def self.filter_by()
    House.joins(:address)
         .joins(:dimention)
         .joins(:location)
         .where("houses.room = #{2}")
  end

end

# SELECT * FROM houses
# 	JOIN addresses
#     ON addresses.id = houses.address_id
#     JOIN dimentions
#     ON dimentions.id = houses.dimention_id
#     JOIN locations
#     ON locations.id = houses.location_id
# 	WHERE houses.room = 20 or houses.title = "Casa luxuosa a venda" or  houses.living_room = 10
#     or houses.bath_room = 20 or houses.yard = 10 or houses.kitchen = 30 or houses.balcony = 30 
# 	or houses.condition = 110
#   	or houses.type_negotiation = 201 
# 	or houses.price = 68000
#  	or houses.garage = 10
# 	or houses.pool = 20
# 	or houses.description = "Casa bem localizada em condições prontra para morar"
# 	or houses.tipology = 330
# 	or houses.next_by = 450 
# 	or houses.furnished = true 
# 	or houses.property_type = 650
# 	or houses.address_id = 10
# 	or houses.dimention_id = 10
# 	or houses.location_id = 10
