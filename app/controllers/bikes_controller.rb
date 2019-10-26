class BikesController < ApplicationController
    before_action :set_bike, only: [:show, :edit, :update]
  
    def index
      @bikes = Bike.all
    end
  
    def show
      @bike = Bike.find(params[:id])
      
      @available_statuses = []
      current_bike_status = @bike.bike_status.description
      if current_bike_status == 'In station'
        available_status_objects = BikeStatus.where(description: 'In use').or(BikeStatus.where(description: 'Needs repair'))
      else 
        available_status_objects = BikeStatus.where(description: 'In station')
      end
  
      available_status_objects.each do |status|
        @available_statuses << [status.id, status.description]
      end
    end
  
    def edit
    end
  
    def update
      @bike.update(bike_params)
      redirect_to bike_path(@bike)
    end
  
    private
    def set_bike
      @bike = Bike.find(params[:id])
    end
  
    def bike_params
      params.require(:bike).permit(:station_id, :bike_status_id)
    end
  end