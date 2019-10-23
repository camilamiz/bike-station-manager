require 'rails_helper'

RSpec.describe Bike, :type => :model do
    it "is valid with valid attributes" do
      @bike1 = build(:bike)
      expect(@bike1).to be_valid
    end

    it "belongs to a station" do
        bike2 = build(:bike, station: nil)
        expect(bike2).to_not be_valid
    end

    it "has a bike status" do
      bike2 = build(:bike, bike_status: nil)
      expect(bike2).to_not be_valid
  end
end