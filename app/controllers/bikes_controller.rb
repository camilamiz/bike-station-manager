class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update]

  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
    @available_statuses = []
    available_status_objects = BikeStatus.all - BikeStatus.where(id: @bike.bike_status_id)
    
    available_status_objects.each do |status|
      @available_statuses << [status.id, status.description]
    end
  end

  def edit
  end

  def update
  end

  private
  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:station_id, :bike_status_id)
  end
end
