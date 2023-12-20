module EnumsConcerns
    extend ActiveSupport::Concern
    included do 
        enum condition: { brand_new: 10, renovated: 11, unfinished: 12, used: 13}
        enum type_negotiation: {
            rent_monthly: 20, rent_daily: 21, rent_shared: 22, sell: 23
        }

        enum tipology: { 
            T1: 31, T2: 32, T3: 33, T4: 34, 
            T5: 35, T6: 36, T7: 37, Tn: 39 
        }

        enum next_by: { 
            airport: 40, church: 41, food_court: 42, football_stadium: 43, 
            leisure_park: 44, militar_station: 45, main_road: 46, high_school: 47, 
            gymnasium: 48, police_office: 49, playground: 50, primary_school: 51, 
            supermarket: 52, secondary_school: 53, trade_square: 54,
            train_or_metrol_station: 55, university: 56
        }

        enum property_type: { apartamento: 60, country_house: 61, enterprise: 62, 
            hotel: 63,  farm: 64, office: 65, stock_store: 66, room: 67, 
            shop_house: 68, restaurant: 69, others: 79
        }
    end
end