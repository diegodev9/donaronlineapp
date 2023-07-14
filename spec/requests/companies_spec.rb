require 'rails_helper'
require 'devise/jwt/test_helpers'
require 'support/devise_for_request'
require 'support/database_cleaner'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/companies", type: :request do
  let(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }
  let(:new_user) { create(:user, level: 1) }
  let(:authorization_headers) { Devise::JWT::TestHelpers.auth_headers(headers, new_user) }
  let(:new_company) { build(:company) }

  before do
    new_company.save
  end

  describe "GET /index" do
    it "renders a successful response" do
      new_company.save
      get companies_url, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      new_company.save
      get company_url(new_company), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create", skip_before: true do
    context "with valid parameters" do
      it "creates a new Company" do
        expect do
          post companies_url,
               params: { company: new_company }, headers: authorization_headers, as: :json
        end.to change(Company, :count).by(1)
      end

      it "renders a JSON response with the new company" do
        post companies_url,
             params: { company: new_company }, headers: authorization_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Company" do
        expect do
          post companies_url,
               params: { company: new_company }, as: :json
        end.to change(Company, :count).by(0)
      end

      it "renders a JSON response with errors for the new company" do
        post companies_url,
             params: { company: new_company }, headers: nil, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    new_attributes = { name: Faker::Company.name }

    context "with valid parameters" do
      it "updates the requested company" do
        patch company_url(new_company),
              params: { company: new_attributes }, headers: authorization_headers, as: :json
        new_company.reload
        expect(new_company.name).to eq(new_attributes[:name])
      end

      it "renders a JSON response with the company" do
        patch company_url(new_company),
              params: { company: new_attributes }, headers: authorization_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the company" do
        patch company_url(new_company),
              params: { company: { name: '' } }, headers: authorization_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested company" do
      expect do
        delete company_url(new_company), headers: authorization_headers, as: :json
      end.to change(Company, :count).by(-1)
    end
  end
end
