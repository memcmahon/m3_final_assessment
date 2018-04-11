require 'rails_helper'

describe "As a user" do
  describe "when I send a get request to api/v1/user/favorites" do
    it "shows a list of my favorites" do
      user = create(:user)
      favorite = create(:favorite, user: user)
      api_key = create(:api_key, user: user)

      get "/api/v1/user/favorites?api_key=#{api_key.value}"

      expect(response.status).to eq(200)
      expect(response.body).to eq([{"id"=>13,
        "neo_reference_id"=>"2153306",
        "user_id"=>211,
        "asteroid"=>
          {"name"=>"153306 (2001 JL1)",
            "neo_reference_id"=>"2153306",
            "is_potentially_hazardous"=>false}}])

    end
  end
end
