require 'faker'

User.create([
    {name: Faker::Name.name, email: Faker::Internet.email, document_number: '123456678'},
    {name: Faker::Name.name, email: Faker::Internet.email, document_number: '123462278'},
    {name: Faker::Name.name, email: Faker::Internet.email, document_number: '213456678'},
])

BikeStatus.create([
    {description: 'In station'}, 
    {description: 'In use'}, 
    {description: 'Needs repair'}, 
    {description: 'Being repaired'}
])

Station.create([
    {capacity: 10},
    {capacity: 15},
    {capacity: 10},
    {capacity: 20}
])

Bike.create([
    {station_id: 1, bike_status_id: 1},
    {station_id: 2, bike_status_id: 2},
    {station_id: 3, bike_status_id: 1}
])

Trip.create([
    {
        start_time: Time.now, 
        end_time: Time.now, 
        travelled_distance_meter: 200, 
        bike_id: 1, 
        user_id: 1, 
        origin_station_id: 1, 
        destiny_station_id: 2
    },
    {   
        start_time: Time.now, 
        end_time: Time.now, 
        travelled_distance_meter: 1100, 
        bike_id: 3, 
        user_id: 2, 
        origin_station_id: 2, 
        destiny_station_id: 1
    },
    {
        start_time: Time.now, 
        end_time: Time.now, 
        travelled_distance_meter: 3300,
        bike_id: 2, 
        user_id: 3, 
        origin_station_id: 4, 
        destiny_station_id: 2
    }

])