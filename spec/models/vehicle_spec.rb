require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  let(:vehicle) { Vehicle.create(vehicle_identifier: 'ABC123') }
  
  it "is valid with valid attributes" do
    expect(vehicle).to be_valid
  end

  it "is invalid with invalid attributes" do
    vehicle.vehicle_identifier = nil
    expect(vehicle).to be_invalid
  end

  it "has many gps_points" do
    assc = described_class.reflect_on_association(:gps_points)
    expect(assc.macro).to eq :has_many
  end
end