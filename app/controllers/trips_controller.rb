class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :end_trip]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
  end

  def create
  end

  def end_trip
  end

  private
  def set_trip
    @trip = Trip.find(params[:id])
  end
end
