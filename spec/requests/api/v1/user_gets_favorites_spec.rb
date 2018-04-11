require 'rails_helper'

describe "As a user" do
  describe "when I send a get request to api/v1/user/favorites" do
    it "shows a list of my favorites" do
      user = create(:user)
      favorite = create(:favorite, id: 13, user: user)
      api_key = create(:api_key, user: user)

      get "/api/v1/user/favorites?api_key=#{api_key.value}"

      binding.pry

      expect(response.status).to eq(200)
      expect(response.body).to eq(([{"id"=>13,
        "neo_reference_id"=>"2153306",
        "user_id"=>"#{user.id}",
        "asteroid"=>
          {"name"=>"153306 (2001 JL1)",
            "is_potentially_hazardous"=>false}}]).to_s)

    end
  end
end
