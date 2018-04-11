require 'rails_helper'

describe "As a user" do
  describe "when I send a get request to api/v1/favorites" do
    it "shows a list of my favorites" do
      get '/api/v1/favorites'

      expect(response.status).to eq(200)
      
    end
  end
end
