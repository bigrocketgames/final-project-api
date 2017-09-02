require 'rails_helper'

  RSpec.describe "Api::V1::SubSports", Type: :request do

    before(:each) do
      params_sport = {
        sport: {
          sport_name: "Football"
        }
      }

      post "/api/v1/sports",
        params: params_sport.to_json,
        headers: { 'Content-Type': 'application/json' }


      params_sub_sport = {
        sub_sport: {
          name: "NFL",
          conference_split: true,
          sport_id: Sport.find_by(sport_name: "Football").id
        }
      }

      post "/api/v1/sub_sports",
        params: params_sub_sport.to_json,
        headers: { 'Content-Type': 'application/json' }

      @response = response

    end

    describe "POST /sub_sports" do

      describe "on success" do

        it "creates a Sub Sport from the params" do
          expect(SubSport.all.count).to eq(1)
        end

        it "returns the new sub sport" do
          body = JSON.parse(@response.body)
          
          expect(response.status).to eq(200)
          expect(body['sub_sport']['id']).not_to eq(nil)
          expect(body['sub_sport']['name']).to eq("NFL")
        end

      end
    end

    describe "DELETE /sub_sports" do

      it "deletes the sub_sport" do
        expect(SubSport.all.count).to eq(1)
        subsport_id = SubSport.find_by(name: "NFL").id

        delete "/api/v1/sub_sports/" + subsport_id.to_s,
          headers: { 'Content-Type': 'application/json' }

        expect(SubSport.all.count).to eq(0)
      end
    end
  end