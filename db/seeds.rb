# First create at least 2 users after run this seed

puts "Cadastrando as provincias..."
Province.find_or_create_by!(province_name: "Luanda")
Province.find_or_create_by!(province_name: "Úige")
Province.find_or_create_by!(province_name: "Uila")
Province.find_or_create_by!(province_name: "Kuanza Sul")
puts "Fim do cadastro de provincias."

puts "Cadastrando municipios/cidade..."
City.find_or_create_by!(city_name: "Belas", province: Province.first)
City.find_or_create_by!(city_name: "Rangel", province: Province.first)
City.find_or_create_by!(city_name: "Cazenga", province: Province.first)
City.find_or_create_by!(city_name: "Viana", province: Province.first)
puts "Fim do cadastro das municipios/cidade."


puts "Cadastrando as cidades...."
Address.find_or_create_by!(street: "Centralidade do Kilamba", city: City.all.sample)
Address.find_or_create_by!(street: "Rangel rua 17", city: City.all.sample)
Address.find_or_create_by!(street: "Talalice", city: City.all.sample)
Address.find_or_create_by!(street: "Mutamba", city: City.all.sample)
puts "Fim do cadastro das cidades."

puts "Cadastrando usuarios...."
user = User.new 
user.email = "vicenteviciii@gmail.com"
user.password = "12345678"
user.password_confirmation = "12345678"
user.save!

user = User.new
user.email = "vicenteviciii@outlook.com"
user.password = "12345678"
user.password_confirmation = "12345678"
user.save!
puts "Fim do cadastro de usuários."

puts "Cadastrando as perfis...."
Profile.find_or_create_by!(
    name_profile: "Vicente Simão", 
    phone1: "944889722",
    phone2: "666666666",
    profile_type: "SUPER_ADMINISTRADOR756",
    gender: "MASCULINE",
    address: Address.all.sample,
    user: User.first
)
Profile.find_or_create_by!(
    name_profile: "Vicente Simão", 
    phone1: "942222222",
    phone2: "994444444",
    profile_type: "CLIENTE",
    gender: "MASCULINE",
    address: Address.all.sample,
    user: User.last
)
puts "Fim do cadastro de perfis."


puts "Cadastrando as Dimention..."
2.times do 
Dimention.find_or_create_by!(
    width_d: 100, 
    height_d: 100
)
end
puts "Fim do cadastro de Dimention."

puts "Cadastrando as land..."
3.times do
Land.find_or_create_by!(
    title_land: "Terreno no Bita Tanke", 
    description: "Esse é um terreno grande bem localizado.",
    price: "5000",
    dimention: Dimention.all.sample,
    address: Address.all.sample
)
end
puts "Fim do cadastro de land."


puts "Cadastrando favorite land..."
4.times do 
FavoriteLand.find_or_create_by!(
    land: Land.last,
    profile: Profile.last
)
FavoriteLand.find_or_create_by!(
    land: Land.first,
    profile: Profile.first
)
end
puts "Fim do cadastro de favorite_land."


puts "Cadastrando profile_land..."
ProfileLand.find_or_create_by!(
    land: Land.last,
    profile: Profile.first
)
ProfileLand.find_or_create_by!(
    land: Land.first,
    profile: Profile.last
)
puts "Fim do cadastro de profile_land."

puts "Cadastrando as Location..."
4.times do
Location.find_or_create_by!(
    longitude: 770000, 
    latitude: 770000
)
end
puts "Fim do cadastro de Location."


puts "Cadastrando a house."
House.find_or_create_by!(
room: 2, 
title: "Casa luxuosa a venda", 
living_room: 1, 
bath_room: 2, 
yeard: 1, 
kitchen: 3, 
balcony: 3, 
condition: "NEW", 
type_negotiation: "RENT_MONTHLY", 
price: 68000, 
garage: 1, 
pool: 2, 
description: "Casa bem localizada em condições prontra para morar", 
tipology: "T5", 
next_by: "PRIMARY_SCHOOL", 
furnished: true, 
property_type: "APARTAMENTO", 
address: Address.first,
dimention: Dimention.first,
location: Location.first
)

House.find_or_create_by!(
    room: 2, 
    title: "Casa Feia bem feia", 
    living_room: 1, 
    bath_room: 2, 
    yeard: 1, 
    kitchen: 3, 
    balcony: 3, 
    condition: "RENOVATED", 
    type_negotiation: "RENT_MONTHLY", 
    price: 98000, 
    garage: 1, 
    pool: 2, 
    description: "Casa bem localizada em condições prontra para morar", 
    tipology: "T2", 
    next_by: "GYMANASIUM", 
    furnished: true, 
    property_type: "ENTERPRISE", 
    address: Address.last,
    dimention: Dimention.last,
    location: Location.last
)
puts "Fim do cadastro de house."


puts "Cadastrando profile_house..." 
ProfileHouse.find_or_create_by!(
    house: House.last,
    profile: Profile.first
)
ProfileHouse.find_or_create_by!(
    house: House.first,
    profile: Profile.last
)
puts "Fim do cadastro de profile_house."


puts "Cadastrando favorite house..." 
FavoriteHouse.find_or_create_by!(
    house: House.first,
    profile: Profile.first
)
FavoriteHouse.find_or_create_by!(
    house: House.last,
    profile: Profile.last
)
puts "Fim do cadastro de favorite_house."