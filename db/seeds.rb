require 'faker'

User.create([
    {name: Faker::Name.name, email: Faker::Internet.email, document_number: '123456678'},
    {name: Faker::Name.name, email: Faker::Internet.email, document_number: '123462278'},
    {name: Faker::Name.name, email: Faker::Internet.email, document_number: '213456677'},
    {name: Faker::Name.name, email: Faker::Internet.email, document_number: '213456673'},
    {name: Faker::Name.name, email: Faker::Internet.email, document_number: '213456671'},
    {name: Faker::Name.name, email: Faker::Internet.email, document_number: '213456778'},
    {name: Faker::Name.name, email: Faker::Internet.email, document_number: '213456555'},
    {name: Faker::Name.name, email: Faker::Internet.email, document_number: '213459999'},
    {name: Faker::Name.name, email: Faker::Internet.email, document_number: '213452222'}
])

BikeStatus.create([
    {description: 'In station'}, 
    {description: 'In use'}, 
    {description: 'Needs repair'}
])

Station.create([
    {capacity: 10, neighborhood: 'Vila Mariana'},
    {capacity: 15, neighborhood: 'Sé'},
    {capacity: 10, neighborhood: 'Paulista'},
    {capacity: 20, neighborhood: 'Tatuapé'},
    {capacity: 20, neighborhood: 'Mooca'},
    {capacity: 15, neighborhood: 'Sumaŕe'},
    {capacity: 20, neighborhood: 'Santana'}
])

Bike.create([
    {station_id: 1, bike_status_id: 1},
    {station_id: 2, bike_status_id: 2},
    {station_id: 3, bike_status_id: 3},
    {station_id: 1, bike_status_id: 1},
    {station_id: 2, bike_status_id: 3},
    {station_id: 3, bike_status_id: 1},
    {station_id: 1, bike_status_id: 1},
    {station_id: 2, bike_status_id: 2},
    {station_id: 3, bike_status_id: 1},
    {station_id: 1, bike_status_id: 1},
    {station_id: 2, bike_status_id: 2},
    {station_id: 3, bike_status_id: 3},
    {station_id: 1, bike_status_id: 1},
    {station_id: 2, bike_status_id: 2},
    {station_id: 3, bike_status_id: 1},
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
    }
])