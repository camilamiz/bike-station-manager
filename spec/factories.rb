FactoryBot.define do
  factory :station do
    capacity 20
    neighborhood {"Vila Mariana"}
  end
  factory :bike_status do
    description {"In station"}
  end
  factory :bike do
    bike_status
    station
  end
end