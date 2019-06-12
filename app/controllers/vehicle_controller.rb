class VehicleController < ApplicationController

    def show
        @vehicles = Vehicle.all.limit(10)
        @vehicles_map = @vehicles.map{|v| {vehicle_id: v.vehicle_identifier, latitude: v.gps_points.first.latitude, longitude: v.gps_points.first.longitude}}
        gon.vehicles = @vehicles_map
    end
end
