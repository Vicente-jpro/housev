# First create at least 2 users after run this seed

puts "Cadastrando as provincias..."
Province.find_or_create_by!(province_name: "Luanda")
Province.find_or_create_by!(province_name: "Úige")
Province.find_or_create_by!(province_name: "Uila")
Province.find_or_create_by!(province_name: "Kuanza Sul")
puts "Fim do cadastro de provincias."

puts "Cadastrando municipios/cidade..."
City.find_or_create_by!(city_name: "Belas", province: Province.first)
City.find_or_create_by!(city_name: "Gabela", province: Province.last)
City.find_or_create_by!(city_name: "Sumbe", province: Province.last)
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
    @land = Land.new 
    @land.title_land = "Terreno no Bita Tanke" 
    @land.description = "Esse é um terreno grande bem localizado."
    @land.price = "5000"
    @land.dimention = Dimention.all.sample
    @land.address = Address.all.sample

    @land.images.attach([

        io: File.open(Rails.root.join('app', 'assets', 'images', 'room6.jpeg')), 
        filename: 'room5.jpeg', 
        content_type: 'image/jpeg' #,

        # io: File.open(Rails.root.join('app', 'assets', 'images', 'room4.jpeg')), 
        # filename: 'room4.jpeg', 
        # content_type: 'image/jpeg', 

        # io: File.open(Rails.root.join('app', 'assets', 'images', 'room3.jpeg')), 
        # filename: 'room3.jpeg', 
        # content_type: 'image/jpeg',
    ]
    )
    @land.save
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
ProfileLand.find_or_create_by!(
    land: Land.find(2),
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

@house = House.new
@house.room = 2
@house.title = "Casa luxuosa a venda" 
@house.living_room = 1 
@house.bath_room = 2
@house.yard = 1
@house.kitchen = 3 
@house.balcony = 3 
@house.condition = 11
@house.type_negotiation = 21 
@house.price = 68000
@house.garage = 1
@house.pool = 2 
@house.description = "Casa bem localizada em condições prontra para morar", 
@house.tipology = 33 
@house.next_by = 45 
@house.furnished = true 
@house.property_type = 65
@house.address = Address.first
@house.dimention = Dimention.first
@house.location = Location.first
@house.house_images.attach([

    # io: File.open(Rails.root.join('app', 'assets', 'images', 'room1.jpg')), 
    # filename: 'room1.jpg', 
    # content_type: 'image/jpg',

    # io: File.open(Rails.root.join('app', 'assets', 'images', 'room2.jpg')), 
    # filename: 'room2.jpg', 
    # content_type: 'image/jpg', 

    io: File.open(Rails.root.join('app', 'assets', 'images', 'room6.jpeg')), 
    filename: 'room6.jpeg']
)
@house.save

@house = House.new
@house.room = 4
@house.title = "Casa Feia bem feia" 
@house.living_room = 1
@house.bath_room = 2
@house.yard = 1 
@house.kitchen = 3 
@house.balcony = 3 
@house.condition = 13 
@house.type_negotiation = 21 
@house.price = 98000 
@house.garage = 1
@house.pool = 2 
@house.description = "Casa bem localizada em condições prontra para morar"
@house.tipology = 34
@house.next_by = 46 
@house.furnished = true 
@house.property_type = 60
@house.address = Address.last
@house.dimention = Dimention.last
@house.location = Location.last
@house.house_images.attach([

    # io: File.open(Rails.root.join('app', 'assets', 'images', 'room1.jpg')), 
    # filename: 'room1.jpg', 
    # content_type: 'image/jpg',

    # io: File.open(Rails.root.join('app', 'assets', 'images', 'room2.jpg')), 
    # filename: 'room2.jpg', 
    # content_type: 'image/jpg', 

    io: File.open(Rails.root.join('app', 'assets', 'images', 'room6.jpeg')), 
    filename: 'room6.jpeg']
)
@house.save


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


puts "Cadastrando planos..."
Plan.find_or_create_by!(
    name_plans: "Very Basic (Free)",
    price: 3000,
    description: "Can make only 1 post and upload 5 photo;
                  Free for 30 days then you pay;",
)

Plan.find_or_create_by!(
    name_plans: "Very Basic (Free)",
    price: 3000,
    description: "Can make only 1 post and upload 5 photo;
                  Free for 30 days then you pay;"
)

Plan.find_or_create_by!(
    name_plans: "Basic",
    price: 5000,
    description: "Can make only 2 posts and upload 5 photos for each post;
    Notify user when a post is created;"
)

Plan.find_or_create_by!(
    name_plans: "Normal",
    price: 8000,
    description: "Can make only 5 posts and upload 5 photos for each post;
    Notify user when a post is created"
)
puts "Fim do cadastro de planos."

puts "Cadastrando plano selecionado..."

PlansSelected.find_or_create_by!(
    plan: Plan.first,
    day_used: 12,
    duration: 30,
    activated: true,
    first_time: false,
    user: User.first
)

PlansSelected.find_or_create_by!(
    plan: Plan.last,
    day_used: 13,
    duration: 30,
    activated: true,
    first_time: false,
    user: User.last
)
puts "Fim do cadastro selecionado"