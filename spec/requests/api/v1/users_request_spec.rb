require 'rails_helper'

RSpec.describe "Api::V1::Users", Type: :request do

  describe "POST /users" do

    describe "on success" do

      before(:each) do
        params = {
          user: {
            email: "test@test.com",
            password: "password"
          }
        }

        post "/api/v1/users",
          params: params.to_json,
          headers: { 'Content-Type': 'application/json' }

        @response = response
      end

      it "creates a user from the params" do
        expect(User.all.count).to eq(1)
      end
      
      it "returns the new user and a JWT token" do
        body = JSON.parse(@response.body)
        
        expect(response.status).to eq(200)
        expect(body['user']['id']).not_to eq(nil)
        expect(body['user']['email']).to eq("test@test.com")
        expect(body['user']['password_digest']).to eq(nil)
        expect(body['token']).not_to eq(nil)
      end
    end

    describe "on error" do
      it "requires a valid email and password" do
        params = {
          user: {
            email: "",
            password: ""
          }
        }

        post "/api/v1/users",
          params: params.to_json,
          headers: { 'Content-Type': 'application/json' }

        body = JSON.parse(response.body)

        expect(response.status).to eq(500)
        expect(body["errors"]).to eq({
          "password"=>["can't be blank"],
          "email"=>["can't be blank", "is invalid"]
        })
      end
    end
    
  end

end