FactoryBot.define do
  factory :user do
    name {"Walter White"}
    email {"letscook@crystal.com"}
    document_number {"12345678901"}
  end
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