require 'rails_helper'

RSpec.describe "TradeCharges", type: :request do
  describe "GET /trade_charges" do
    it "works! (now write some real specs)" do
      get trade_charges_path
      expect(response).to have_http_status(200)
    end
  end
end
