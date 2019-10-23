class BikePolicy
    attr_reader :bike

    def initialize(bike)
        @bike = bike
    end

    def available?
        status.description == 'In station'
    end
end