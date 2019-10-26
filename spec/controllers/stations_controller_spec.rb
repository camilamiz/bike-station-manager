require 'rails_helper'

RSpec.describe StationsController, :type => :controller do
    describe "GET #index" do
        it "populates an array of stations" do
            station = create(:station)
            station.save
            get :index

            expect(assigns(:stations)).to eq([station])
        end

        it "renders the :index view" do
            get :index
            expect(response).to render_template("index")
        end
    end
    
    describe "GET #show" do
        it "assigns the requested station to @station" do
            station = create(:station)
            get :show, params: {id: station.id}
            expect(assigns(:station)).to eq(station)
        end
        
        it "renders the :show template" do
            station = create(:station)
            get :show, params: {id: station.id}
            expect(response).to render_template("show")
        end 
    end
end