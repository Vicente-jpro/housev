module EnumsConcerns
    extend ActiveSupport::Concern
    included do 
        enum condition: { New: 'New', Renovated: 'RENOVATED', Unfinished:'UNFINISHED', Used: 'USED'}
        enum type_negotiation: {
            Rent_Monthly: 'RENT_MONTHLY', Rent_daily: 'RENT_DAILY', Rent_Shared: 'rent shared'
        }

        enum tipology: { 
            T1:'T1', T2:'T2', T3:'T3', T4:'T4', 
            T5:'T5', T6:'T6', T7:'T7', Tn: 'OTHERS' 
        }

        enum next_by: { 
            Airport:'AIRPORT', 
            Church: 'CHURCH', Food_court: 'FOOD_COURT', Football_stadium:'FOOTBALL_STADIUM', 
            Leisure_park: 'LEISURE_PARK', Militar_station: 'MILITAR_STATION', 
            Main_Road: 'MAIN_ROAD', High_school: 'HIGH_SCHOOL', Gymnasium: 'GYMANASIUM',
            Police_office: 'POLICE_OFFICE', Playground: 'PLAYGROUND',
            Primary_school: 'PRIMARY_SCHOOL', Supermarket: 'SUPERMARKET', 
            Secondary_school: 'SECUNDARY_SCHOOL', Trade_square: 'TRADE_SQUARE', 
            Train_or_metrol_station: 'TRAIN_OR_METROL_STATION', University: 'UNIVERSITY'
        }

        enum property_type: { Apartamento: 'APARTAMENTO', Country_house: 'COUNTRY_HOUSE', 
            Enterprise: 'ENTERPRISE', Hotel: 'HOTEL',  Farm: 'FARM',  Office: 'OFFICE',
            Store:'STORE', Room: 'ROOM', Shop_store: 'SHOP_STORE', 
            Restaurant: 'RESTAURANT', Others: 'OTHERS'
        }
    end
end