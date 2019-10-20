class StationPresenter < SimpleDelegator    
    def initialize(station)
        @station = station        
    end

    def available_bikes_in_station
        in_station_id = BikeStatus.where(description: 'In station').first.id
        Bike.where(station_id: @station.id, bike_status_id: in_station_id)
    end

    def available_bikes_in_station_by_id
        bike_ids = []
        in_station_id = BikeStatus.where(description: 'In station').first.id
        bikes = Bike.where(station_id: @station.id, bike_status_id: in_station_id)
        bikes.each do |bike|
            bike_ids << bike.id
        end
        return bike_ids
    end

    def spots_available
        @station.capacity - self.available_bikes_in_station
    end
end