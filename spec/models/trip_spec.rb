require 'rails_helper'

RSpec.describe Trip, :type => :model do
    it "is valid with valid attributes" do
      trip1 = build(:trip)
      expect(trip1).to be_valid
    end

    it "has a start time" do
        trip2 = build(:trip, start_time: nil)
        expect(trip2).to_not be_valid
    end

    it "has a bike_id" do
      trip2 = build(:trip, bike_id: nil)
      expect(trip2).to_not be_valid
    end

    it "has a origin_station_id" do
      trip2 = build(:trip, origin_station_id: nil)
      expect(trip2).to_not be_valid
    end

    it "has a user_id" do
      trip2 = build(:trip, user_id: nil)
      expect(trip2).to_not be_valid
    end

    it "starts with a bike status 'In station'" do
      bike_status = create(:bike_status)
      bike = create(:bike, bike_status_id: bike_status.id)
      trip2 = build(:trip, bike_id: bike.id)
      expect(trip2).to be_valid
    end

    it "cannot start with a bike status different from 'In station'" do
      bike_status = build(:bike_status, description: 'Needs repair')
      bike = build(:bike, bike_status_id: bike_status.id)
      trip2 = build(:trip, bike_id: bike.id)
      expect(trip2).to_not be_valid
    end

    it "cannot finish where it started" do
      station = build(:station)
      trip2 = build(:trip, origin_station_id: station.id, destiny_station_id: station.id)
      expect(trip2).to_not be_valid
    end
end