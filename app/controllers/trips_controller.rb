require 'httparty'

class TripsController < ApplicationController
    include HTTParty
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
      station = Station.find(trip_params['destiny_station_id'].to_i)
      all_bikes_in_station = StationPresenter.new(station).all_bikes.count
      
      if (all_bikes_in_station + 1) > station.capacity
        flash[:notice] = 'Finalizar a viagem em outra estação, pois está encontra-se cheia.'
        redirect_to trip_path(@trip)
      else

        if @trip.update(trip_params)
          @trip.end_time = Time.new
          @trip.save
          bike_status = BikeStatus.where(description: 'In station').first
          bike = Bike.find(@trip.bike_id)
          bike.bike_status_id = bike_status.id
          bike.station_id = @trip.destiny_station_id
          bike.save 
          
          send_api_trip_notification(@trip)
          
          if @response.code == 201
              flash[:notice] = 'Viagem finalizada!'
              redirect_to trip_path(@trip)
          else
              flash[:notice] = @response.message
              redirect_to trip_path(@trip)
          end
        
        else
          flash[:trip_errors] = @trip.errors.full_messages
          redirect_to trip_path(@trip)
        end
      end
    end
  
    private
    def set_trip
      @trip = Trip.find(params[:id])
    end
  
    def trip_params
      params.require(:trip).permit(:origin_station_id, :destiny_station_id, :travelled_distance_meter, :bike_id, :user_id)
    end

    def send_api_trip_notification(trip)
        access = ENV["ACCESS_API_KEY"]
        @response = HTTParty.post('https://springfield-biketipovc.herokuapp.com/trips', 
        :body => {  user_id: trip.user_id,
                    bike_id: trip.bike_id,
                    started_at: "#{trip.start_time}",
                    finished_at: "#{trip.end_time}",
                    travelled_distance: "#{trip.travelled_distance_meter.to_f}",
                    origin: { station_id: trip.origin_station_id},
                    origin: { destination_id: trip.destiny_station_id }
                }.to_json,
        :headers => { 'Content-Type' => 'application/json', 'Authorization' => "Token #{access}" })
        return @response
    end
end