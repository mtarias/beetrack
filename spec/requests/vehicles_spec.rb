require 'rails_helper'

RSpec.describe "Vehicles", type: :request do
  describe "GET /show" do
    it "redirect to show" do
      get show_path
      expect(response).to have_http_status(200)
    end
  end
end
