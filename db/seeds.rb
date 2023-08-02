# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


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

puts "Cadastrando as perfis...."
Profile.find_or_create_by!(
    name_profile: "Vicente Simão", 
    phone1: "944889722",
    phone2: "995922549",
    profile_type: "CLIENTE",
    gender: 0,
    address: Address.all.sample,
    user: User.first
)
puts "Fim do cadastro de perfis."

puts "Cadastrando as Dimention..."
Dimention.find_or_create_by!(
    width_d: 100, 
    height_d: 100
)

Dimention.find_or_create_by!(
    width_d: 50, 
    height_d: 50
)
puts "Fim do cadastro de Dimention."

puts "Cadastrando as land..."
Land.find_or_create_by!(
    title_land: "Terreno no Bita Tanke", 
    description: "Esse é um terreno grande bem localizado.",
    price: "5000",
    dimention: Dimention.all.sample,
    address: Address.all.sample
)
puts "Fim do cadastro de land."
