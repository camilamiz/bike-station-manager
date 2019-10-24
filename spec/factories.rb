FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    document_number {"12345678901"}
  end
  factory :station do
    capacity 20
    neighborhood {Faker::Science.scientist}
  end
  factory :bike_status do
    description {"In station"}
  end
  factory :bike do
    bike_status
    station
  end
  factory :trip do
    user
    bike
    start_time {DateTime.now - 1}
    end_time {DateTime.now}
    origin_station_id { create(:station).id }
    destiny_station_id { create(:station).id }
  end
end