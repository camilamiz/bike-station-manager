require 'spec_helper'

RSpec.describe Trip, type: :model do
  context 'when saving a new trip' do
    it 'the rented bike cannot need repair or in use' do
      bike_status = BikeStatus.create!(description: 'Needs repair')
      station = Station.create!
      user = User.create!
      bike = Bike.create!(bike_status_id: bike_status, station_id: station.id)
      trip = Trip.new(
        origin_station_id: station_id,
        start_time: datetime.now,
        user_id: user.id,
        bike_id: bike.id
      )
      expect(trip.save).to_not be_valid
    end
  end
end
