class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def show
    @Station = Station.find(params[:id])
  end
end
