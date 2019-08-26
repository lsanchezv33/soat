require 'rails_helper'

RSpec.describe "PolicyPayments", type: :request do
  describe "GET /policy_payments" do
    it "works! (now write some real specs)" do
      get policy_payments_path
      expect(response).to have_http_status(200)
    end
  end
end
