class Land < ApplicationRecord
  attr_accessor :province_code, :city_code, :client_name, :client_email, :client_message
  
  belongs_to :dimention
  accepts_nested_attributes_for :dimention, allow_destroy: true

  
  belongs_to :address
  accepts_nested_attributes_for :address, allow_destroy: true

  has_many :profile_lands, dependent: :destroy
  has_many :profiles, through: :profile_lands
  has_many :favorite_land, dependent: :destroy

  has_many_attached :images
  validates_presence_of :title_land, :description, :price, :images

  JOIN_CITIES_AND_PROVINCES = "JOIN cities ON cities.id = addresses.city_id JOIN provinces ON provinces.id = cities.province_id"
 

  def self.find_lands_by_user(user)
    Land.joins(:profiles)
        .where("profiles.user_id = #{user.id}")
        .order(id: :desc)
  end
  
  def self.find_land_by_user(user, land)
    Land.joins(:profiles)
        .where("profiles.user_id = #{user.id} and lands.id = #{land.id}")
        .order(id: :desc)
  end

  def self.search_by(house_params)
    Land.joins(:address)
        .joins(:dimention)
        .joins(JOIN_CITIES_AND_PROVINCES)     
        .or(House.where('LOWER(title) LIKE ?', "%#{house_params[:title].downcase if house_params[:title].present? }%"))
        .or(House.where("provinces.id = #{house_params[:province_code] if house_params[:province_code].present?}" ))
        .or(House.where("cities.id = #{house_params[:city_code] if house_params[:city_code].present? }"))
        .or(House.where(price: house_params[:price]))
        .order(:title)
  end

end

