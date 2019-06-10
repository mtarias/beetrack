require 'rails_helper'

RSpec.describe Vehicle, :type => :model do
  it "is valid with valid attributes" do
    expect(Vehicle.new).to be_valid
  end
end