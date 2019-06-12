class Api::V1::GpsController < ApplicationController
    skip_before_action :verify_authenticity_token

    include Response

    def index
        @vehicle = Vehicle.find_by(vehicle_identifier: params[:vehicle_identifier])

        if @vehicle.nil?
            @vehicle = Vehicle.new(vehicle_identifier: params[:vehicle_identifier])
        end
        
        if !@vehicle.save
            json_response({message: @vehicle.errors}, :unprocessable_entity)
        else
            @gps = GpsPoint.new(gps_point_params)

            if @gps.save
                @vehicle.gps_points << @gps
                json_response(@gps, :ok)
            else
                json_response({message: @gps.errors}, :unprocessable_entity)
            end

        end
    end

    private
        def gps_point_params
            params.permit(:latitude, :longitude, :sent_at)
        end
end
