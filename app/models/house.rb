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

  def self.filter_by(house)
    House.joins(:address)
         .joins(:dimention)
         .joins(:location)
         .where("houses.room = #{house.room}")
         .or("houses.title LIKE '%#{house.title}%'")
         .or("houses.living_room = #{house.living_room}")
         .or("houses.yard = #{house.yard}")
         .or("houses.kitchen = #{house.kitchen}")
         .or("houses.balcony = #{house.balcony}")
         .or("houses.condition = #{house.condition}")
         .or("houses.type_negotiation = #{house.type_negotiation}")
         .or("houses.price = #{house.price}")
         .or("houses.garage = #{house.price}")
         .or("houses.pool = #{house.pool}")
         .or("houses.description LIKE '%#{house.description}%'")
         .or("houses.tipology = #{house.tipology}%")
         .or("houses.next_by = #{house.next_by}")
         .or("houses.furnished = #{house.furnished}")
         .or("houses.property_type = #{house.property_type}")
         .or("houses.address_id = #{house.address_id}")
         .or("houses.dimention_id = #{house.dimention_id}")
         .or("houses.location_id = #{house.location}")
  end

end