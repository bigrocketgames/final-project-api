require 'rails_helper'

RSpec.describe "Api::V1::Sports", Type: :request do

  describe "POST /sports" do
    
    describe "on success" do

      before (:each) do
        params = {
          sport: {
            sport_name: "Football"
          }
        }

        post "/api/v1/sports",
          params: params.to_json,
          headers: { 'Content-Type': 'application/json' }

        @response = response

      end

      it "creates a sport from the params" do
        expect(Sport.all.count).to eq(1)
      end

      it "returns the new sport" do
        body = JSON.parse(@response.body)

        expect(response.status).to eq(200)
        expect(body['id']).not_to eq(nil)
        expect(body['sport_name']).to eq("Football")
      end

    end

  end

end