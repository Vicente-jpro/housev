module EnumsConcerns
    extend ActiveSupport::Concern
    enum condition: { Used: 'USED', Renovated: 'RENOVATED', Unfinished:'UNFINISHED'}
    enum type_negotiation: {
        Rent_Monthly: 'RENT_MONTHLY', Rent_daily: 'RENT_DAILY', Rent_Shared: 'rent shared'
     }

    enum tipology: { T1:'T1', T2:'T2', T3:'T3', T4:'T4', T5:'T5' T6:'T6', T7:'T7', Others: 'OTHERS' }

    enum next_by: { 
        Church: 'CHURCH', Supermarket: 'SUPERMARKET', Food_court: 'FOOD_COURT',
        Trade_square: 'TRADE_SQUARE', University: 'UNIVERSITY', 
        Primary_school: 'PRIMARY_SCHOOL',Secondary_school: 'SECUNDARY_SCHOOL', 
        High_school: 'HIGH_SCHOOL', Playground: 'PLAYGROUND', Leisure_park: 'LEISURE_PARK', 
        Gymnasium: 'GYMANASIUM', Football_stadium:'FOOTBALL_STADIUM', Main_Road: 'MAIN_ROAD', 
        Train_or_metrol_station: 'TRAIN_OR_METROL_STATION', Airport:'AIRPORT' 
        }

    <%= form.label :property_type, style: "display: block" %>
    <%= form.text_field :property_type %>
end