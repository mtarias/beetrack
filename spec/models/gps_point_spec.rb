require 'rails_helper'

RSpec.describe GpsPoint, :type => :model do
  it "is valid with valid attributes" do
    expect(GpsPoint.new).to be_valid
  end
end