module FavoriteLandsHelper

    def favorite_land_built(profile, land)
        favorite_land = FavoriteLand.new 
        favorite_land.profile_id = profile.id 
        favorite_land.land_id = land.id 
        favorite_land
    end
end
