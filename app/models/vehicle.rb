class Vehicle < ActiveRecord::Base
    has_many :gps_points, -> { order 'sent_at desc' }

    validates :vehicle_identifier, presence: true
end
