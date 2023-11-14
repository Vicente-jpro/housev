class House < ApplicationRecord
    include EnumsConcerns
  attr_accessor :province_code
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

  # Book.where("title LIKE ?",
  #   Book.sanitize_sql_like(params[:title]) + "%")
  

  def self.search_by(house_params)
    House.joins(:address)
         .joins(:dimention)
         .joins(:location)
         .where(room: house_params[:room])
         .or(House.where('LOWER(title) LIKE ?', "%#{house_params[:title].downcase if house_params[:title].present? }%"))
         .or(House.where(living_room: house_params[:living_room]) )
         .or(House.where(yard: house_params[:yard]))
         .or(House.where(kitchen: house_params[:kitchen]))
         .or(House.where(balcony: house_params[:balcony]))
         .or(House.where(condition: house_params[:condition]))
         .or(House.where(type_negotiation: house_params[:type_negotiation]))
         .or(House.where(price: house_params[:price]))
         .or(House.where(garage: house_params[:garage]))
         .or(House.where(pool: house_params[:pool]))
         .or(House.where('LOWER(description) LIKE ?', "%#{house_params[:description].downcase if house_params[:description].present?}%"))
         .or(House.where(tipology: house_params[:tipology]))
         .or(House.where(next_by: house_params[:next_by]))
         .or(House.where(furnished: house_params[:furnished]))
         .or(House.where(property_type: house_params[:property_type]))
         .or(House.where(address_id: house_params[:address_id]))
         .or(House.where(dimention_id: house_params[:dimention_id]))
         .or(House.where(location_id: house_params[:location]))
         .order(:title)
  end

  # def self.search_by(house)
  #   House.joins(:address)
  #        .joins(:dimention)
  #        .joins(:location)
  #        .where(room: house.room)
  #        .or(House.where('LOWER(title) LIKE ?', "%#{house.title.downcase}%"))
  #        .or(House.where(living_room: house.living_room) )
  #        .or(House.where(yard: house.yard ))
  #        .or(House.where(kitchen: house.kitchen))
  #        .or(House.where(balcony: house.balcony))
  #        .or(House.where(condition: house.condition))
  #        .or(House.where(type_negotiation: house.type_negotiation))
  #        .or(House.where(price: house.price))
  #        .or(House.where(garage: house.garage))
  #        .or(House.where(pool: house.pool))
  #        .or(House.where('LOWER(description) LIKE ?', "%#{house.description.downcase}%"))
  #        .or(House.where(tipology: house.tipology))
  #        .or(House.where(next_by: house.next_by))
  #        .or(House.where(furnished: house.furnished))
  #        .or(House.where(property_type: house.property_type))
  #        .or(House.where(address_id: house.address_id))
  #        .or(House.where(dimention_id: house.dimention_id))
  #        .or(House.where(location_id: house.location))
  #        .order(:title)
  # end


end