require 'rails_helper'

describe "As a guest user" do
  describe "When I visit root" do
    it "I can search by date range" do
      visit '/'

      fill_in "Start Date", with: "2018-01-01"
      fill_in "End Date", with: "2018-01-01"
      click_on "Determine Most Dangerous Day"

      expect(current_path).to eq("/most_dangerous_day")
      within(".header") do
        expect(page).to have_content("Most Dangerous Day")
        expect(page).to have_content("January 1, 2018 - January 7, 2018")
      end

      within (".most-danger") do
        expect(page).to have_content("January 1, 2018")
        expect(page).to have_content("Name: (2014 KT76)")
        expect(page).to have_content("NEO Reference ID: 3672906")
        expect(page).to have_content("Name: (2001 LD)")
        expect(page).to have_content("NEO Reference ID: 3078262")
        expect(page).to have_content("Name: (2017 YR1)")
        expect(page).to have_content("NEO Reference ID: 3794979")

      end
    end
  end
end
