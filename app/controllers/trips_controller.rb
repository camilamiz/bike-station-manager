class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :end_trip]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
    @users = []

    User.all.each do |user|
      @users << [user.id, user.name]
    end
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.start_time = Time.new
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

  def end_trip
  end

  private
  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:origin_station_id, :bike_id, :user_id)
  end
end
