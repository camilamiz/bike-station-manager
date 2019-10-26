class TripsController < ApplicationController
    before_action :set_trip, only: [:show, :edit, :update]
  
    def index
      @trips = Trip.all
    end
  
    def show
      @origin_station = Station.where(id: @trip.origin_station_id)
      @user = User.find(@trip.user_id)
  
      @destiny_stations = [] 
      destiny_stations_objects = Station.all - @origin_station
  
      destiny_stations_objects.each do |object|
        @destiny_stations << [object.id, object.neighborhood]
      end
    end
  
    def new
      @trip = Trip.new
      @users = []
  
      User.all.each do |user|
        @users << [user.id, user.name]
      end
    end
  
    def create
      bike = Bike.find(params['trip']['bike_id'].to_i)
      if bike.bike_status.description == 'In station'
        @trip = Trip.new(trip_params)
        @trip.start_time = Time.new
      else
        render :new
      end
      if @trip.save
        bike_status = BikeStatus.where(description: 'In use').first
        bike = Bike.find(trip_params[:bike_id])
        bike.bike_status_id = bike_status.id
        bike.save
        redirect_to trip_path(@trip), notice: 'Bike alugada!'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @trip.update(trip_params)
        @trip.end_time = Time.new
        @trip.save
        bike_status = BikeStatus.where(description: 'In station').first
        bike = Bike.find(@trip.bike_id)
        bike.bike_status_id = bike_status.id
        bike.station_id = @trip.destiny_station_id
        bike.save
        redirect_to trips_path, notice: 'Viagem finalizada!'
      else
        render :index
      end
    end
  
    private
    def set_trip
      @trip = Trip.find(params[:id])
    end
  
    def trip_params
      params.require(:trip).permit(:origin_station_id, :destiny_station_id, :travelled_distance_meter, :bike_id, :user_id)
    end
  end