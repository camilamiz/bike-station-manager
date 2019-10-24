require 'rails_helper'

RSpec.describe Station, :type => :model do
    it "is valid with valid attributes" do
      @station1 = build(:station)
      expect(@station1).to be_valid
    end

    it "has a capacity" do
        station2 = build(:station, capacity: nil)
        expect(station2).to_not be_valid
    end

    it "has a neighborhood" do
      station2 = build(:station, neighborhood: nil)
      expect(station2).to_not be_valid
  end
end