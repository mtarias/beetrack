require 'rails_helper'

RSpec.describe VehicleController, type: :controller do
    describe "GET #show" do
        let(:gps_point) { GpsPoint.create(latitude: '-33.451897', longitude: '-70.664476') }
        let(:vehicle) { Vehicle.create(vehicle_identifier: 'ABC123') }

        before do
            get :show
        end
        it "returns http success" do
            expect(response).to have_http_status(:success)
        end
        it "JSON body response contains expected vehicle attributes" do
            vehicle.gps_points << gps_point
            get :show
            expect(assigns(:vehicles)).to eq([vehicle])
        end
    end
end
