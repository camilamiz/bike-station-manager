require 'rails_helper'

RSpec.describe TripsController, :type => :controller do
    describe "GET #index" do
        it "populates an array of trips" do
            trip = create(:trip)
            trip.save
            get :index

            expect(assigns(:trips)).to eq([trip])
        end

        it "renders the :index view" do
            get :index
            expect(response).to render_template("index")
        end
    end
    
    describe "GET #show" do
        it "assigns the requested trip to @trip" do
            trip = create(:trip)
            get :show, params: {id: trip.id}
            expect(assigns(:trip)).to eq(trip)
        end
        
        it "renders the :show template" do
            trip = create(:trip)
            get :show, params: {id: trip.id}
            expect(response).to render_template("show")
        end 
    end

    describe "POST create" do
        context "with valid attributes" do
            it "renders the :show template after create" do
                trip = create(:trip)
                get :show, params: {id: trip.id}
                expect(response).to render_template("show")
            end 
        end
    end
end