require 'rails_helper'

RSpec.describe BikeStatus, :type => :model do
    it "is valid with valid attributes" do
        bike_status1 = build(:bike_status)
        expect(bike_status1).to be_valid
    end

    it "has a description" do
        bike_status2 = build(:bike_status, description: nil)
        expect(bike_status2).to_not be_valid
    end

    it "has a unique description" do
        bike_status1 = create(:bike_status)
        bike_status2 = build(:bike_status)
        expect(bike_status2).to_not be_valid
    end
end