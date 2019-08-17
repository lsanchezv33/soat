# frozen_string_literal: true

require 'rails_helper'
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe PolicyPaymentsController, type: :controller do
  before(:all) do
    @policy_payment = create(:policy_payment)
  end

  describe 'GET #index' do
    subject { get :index }

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
      expect(subject).to render_template('index')

      expect(assigns[:policy_payments].size).to eq 1
    end
  end

  # describe "GET #show" do
  #   it "returns a success response" do
  #     policy_payment = PolicyPayment.create! valid_attributes
  #     get :show, params: { id: policy_payment.to_param },
  #                 session: valid_session
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET #new" do
  #   it "returns a success response" do
  #     get :new, params: {}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns a success response" do
  #     policy_payment = PolicyPayment.create! valid_attributes
  #     get :edit, params: {id: policy_payment.to_param}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new PolicyPayment" do
  #       expect {
  #         post :create, params: {policy_payment: valid_attributes}, session: valid_session
  #       }.to change(PolicyPayment, :count).by(1)
  #     end

  #     it "redirects to the created policy_payment" do
  #       post :create, params: {policy_payment: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(PolicyPayment.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'new' template)" do
  #       post :create, params: {policy_payment: invalid_attributes}, session: valid_session
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested policy_payment" do
  #       policy_payment = PolicyPayment.create! valid_attributes
  #       put :update, params: {id: policy_payment.to_param, policy_payment: new_attributes}, session: valid_session
  #       policy_payment.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "redirects to the policy_payment" do
  #       policy_payment = PolicyPayment.create! valid_attributes
  #       put :update, params: {id: policy_payment.to_param, policy_payment: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(policy_payment)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       policy_payment = PolicyPayment.create! valid_attributes
  #       put :update, params: {id: policy_payment.to_param, policy_payment: invalid_attributes}, session: valid_session
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested policy_payment" do
  #     policy_payment = PolicyPayment.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: policy_payment.to_param}, session: valid_session
  #     }.to change(PolicyPayment, :count).by(-1)
  #   end

  #   it "redirects to the policy_payments list" do
  #     policy_payment = PolicyPayment.create! valid_attributes
  #     delete :destroy, params: {id: policy_payment.to_param}, session: valid_session
  #     expect(response).to redirect_to(policy_payments_url)
  #   end
  # end

  # use to delete record ----------------------------------
  after(:all) do
    @policy_payment&.destroy
  end
end
