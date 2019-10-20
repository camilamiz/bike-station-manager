class Trip < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  validates :start_time, presence: true

  validate :disallow_park_in_origin

  private
  def disallow_park_in_origin
    if (origin_station_id == destiny_station_id)
      errors.add(:origin_station_id, 'Your trip has to end in a different station')
    end
  end
end
