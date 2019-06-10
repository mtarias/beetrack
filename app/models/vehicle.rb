class Vehicle < ActiveRecord::Base
    has_many :gps_points
end
