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


puts "Cadastrando as perfis...."
2.times do 
Profile.find_or_create_by!(
    name_profile: "Vicente Simão", 
    phone1: "944889722",
    phone2: "995922549",
    profile_type: "CLIENTE",
    gender: "MASCULINE",
    address: Address.all.sample,
    user: User.first
)
end
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
5.times do
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
3.times do 
FavoriteLand.find_or_create_by!(
    land: Land.all.sample,
    profile: Profile.all.sample
)
end
puts "Fim do cadastro de favorite land."


