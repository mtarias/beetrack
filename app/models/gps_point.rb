class GpsPoint < ActiveRecord::Base
    belongs_to :vehicle

    validates :latitude, presence: true
    validates :longitude, presence: true

    before_create :latitude_and_longitude_are_numbers?

    def latitude_and_longitude_are_numbers?
        if (Float(latitude) rescue nil) == nil
            errors.add(:latitude, 'latitude is not a number')
        elsif (Float(longitude) rescue nil) == nil
            errors.add(:longitude, 'longitude is not a number')
        end
    end
end
