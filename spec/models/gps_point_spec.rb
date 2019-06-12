require 'rails_helper'

RSpec.describe GpsPoint, type: :model do
  let(:gps_point) { GpsPoint.create(latitude: '-33.451897', longitude: '-70.664476') }

  it "is valid with valid attributes" do
    expect(gps_point).to be_valid
  end

  it "is invalid with invalid latitude" do
    gps_point.latitude = nil
    expect(gps_point).to be_invalid
  end

  it "is invalid with invalid longitude" do
    gps_point.longitude = nil
    expect(gps_point).to be_invalid
  end

  it "belongs to vehicle" do
    assc = described_class.reflect_on_association(:vehicle)
    expect(assc.macro).to eq :belongs_to
  end
end