require 'rails_helper'

describe "As a user" do
  describe "when I send a post request to api/v1/user/favorites" do
    it "creates a new favorite" do
      user = create(:user)
      api_key = create(:api_key, user: user)

      post "/api/v1/user/favorites?api_key=#{api_key.value}&neo_reference_id=2021277"

      expect(response.status).to eq(200)
      expect(response.body).to eq("{\"id\":#{Favorite.last.id},\"neo_reference_id\":\"2021277\",\"user_id\":#{user.id},\"asteroid\":{\"name\":\"21277 (1996 TO5)\",\"neo_reference_id\":\"2021277\",\"is_potentially_hazardous\":false}}")
    end
  end
end
