require 'rails_helper'

RSpec.describe 'Users show page' do
  before(:each) do
    load_test_data
  end
    it "should see option to create character" do
      visit '/'   
      click_link("Log in with Discord")
      
      expect(page).to have_content("Welcome, bubba to Dungeons and Discord!!")

      expect(page).to have_content("New Character")

      # fill_in :name, with: 'Shrek'
      # select('wizard', from: 'index')
      # click_button('Submit')


      expect(current_path).to eq("/users")

      expect(page).to_not have_content("Saving Throws")
    end
end

