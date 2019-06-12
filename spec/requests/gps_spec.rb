require 'rails_helper'

RSpec.describe Api::V1::GpsController, type: :request do
    describe "POST /api/v1/gps" do
        # Valid Payload
        let(:valid_attributes) { { latitude: -33.451897, longitude: -70.664476, sent_at: "2016-06-02 20:45:00", vehicle_identifier: "HA-345" } }

        context 'when the request is valid' do
            before { post '/api/v1/gps', valid_attributes }

            it 'creates a valid gps_point' do
                json = JSON.parse(response.body)
                expect(json['latitude']).to eq(-33.451897)
                expect(json['longitude']).to eq(-70.664476)
                expect(json['sent_at']).to eq("2016-06-02 20:45:00")
            end
    
            it "returns json not empty" do
                expect(response.body).not_to be_empty
            end
    
            it 'returns status code 200' do
                expect(response).to have_http_status(:success)
            end
    
            it "JSON body response contains expected recipe attributes" do
                json_response = JSON.parse(response.body)
                expect(json_response.keys).to match_array(["created_at", "id", "latitude", "longitude", "sent_at", "updated_at", "vehicle_id"])
            end
        end
    
        context 'when the request is invalid' do
            before { post '/api/v1/gps', params: { latitude: '-33.451897' } }
    
            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end
    
            it 'returns a validation failure message' do
                json_response = JSON.parse(response.body)
                expect(json_response['message']['vehicle_identifier'].first).to match(/can't be blank/)
            end
        end
    end
end