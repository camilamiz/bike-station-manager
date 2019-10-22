class BikePresenter < SimpleDelegator    
    def initialize(bike)
        @bike = bike        
    end

    def current_station
        station = Station.find(@bike.station_id)
        return station
    end

    def current_status
        bike_status = BikeStatus.find(@bike.bike_status_id)
        return bike_status.description
    end
end