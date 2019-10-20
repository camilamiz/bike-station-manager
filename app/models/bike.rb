class Bike < ApplicationRecord
  belongs_to :station
  belongs_to :bike_status
  has_many :trips
end
