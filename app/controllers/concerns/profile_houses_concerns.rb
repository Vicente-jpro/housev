module ProfileHousesConcerns
    extend ActiveSupport::Concern

    def create_profile_land(profile, land)
        profile_land = ProfileLand.new
        profile_land.profile_id = profile.id
        profile_land.land_id = @land.id
  
        ProfileLand.create(profile_land.as_json)
    end
  
end
