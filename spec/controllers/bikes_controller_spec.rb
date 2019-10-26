require 'rails_helper'

RSpec.describe BikesController, :type => :controller do
    describe "GET #index" do
        it "populates an array of bikes" do
            bike = create(:bike)
            bike.save
            get :index

            expect(assigns(:bikes)).to eq([bike])
        end

        it "renders the :index view" do
            get :index
            expect(response).to render_template("index")
        end
    end
    
    describe "GET #show" do
        it "assigns the requested contact to @contact" do
            bike = create(:bike)
            get :show, params: {id: bike.id}
            expect(assigns(:bike)).to eq(bike)
        end
        
        it "renders the :show template" do
            bike = create(:bike)
            get :show, params: {id: bike.id}
            expect(response).to render_template("show")
        end 
    end
end