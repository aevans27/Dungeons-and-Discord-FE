require 'rails_helper'


# This is a mock test that doesn't work any more but can be utlized to start something *shrug*

RSpec.describe 'Characters profession page', type: :feature do
  before(:each) do
    load_test_data
  end
  describe "when I get to /prof_create" do
    it "I see a page with a selection of proffession having to do with my class selection " do
      first_response = File.read('spec/fixtures/first_char.json')
      wizard_response = File.read('spec/fixtures/wizard_class.json')
      stub_request(:get, "http://localhost:3000/api/v1/characters?user_id=#{@current_user.id}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: first_response, headers: {})

         stub_request(:post, "http://localhost:3000/api/v1/characters").
         with(
           body: "{\"user_id\":#{@current_user.id},\"name\":\"Shrek\",\"char_class\":\"wizard\",\"race\":\"tiefling\",\"background\":\"Acolyte\",\"alignment\":\"lawful good\"}",
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: "[]", headers: {})

         stub_request(:get, "http://localhost:3000/api/v1/charclasses/wizard").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: wizard_response, headers: {})
         
      visit '/'   
      click_link("Log in with Discord")
      
      expect(page).to have_content("Welcome, bubba to Dungeons and Discord!!")

      expect(page).to have_content("New Character") 
      
      click_link("New Character")
      
      expect(page).to have_content("Name")
      expect(page).to have_field(:name)

      expect(page).to have_content("Select Class")
      expect(page).to have_field(:index)

      fill_in :name, with: 'Shrek'
      select('wizard', from: 'index')
      select('tiefling', from: 'race')
      select('lawful good', from: 'alignment')
      click_button('Submit')
      expect(current_path).to eq("/users/prof_show")
      expect(page).to have_content("Proficiency Choices")
      expect(page).to have_content("Character Proficiency for WIZARD")
      expect(page).to have_content("Select ONLY two")

      find("input[type='checkbox']", match: :first).check
      find(:xpath, "(//input[@type='checkbox'])[2]").check
      click_button('Submit')

      expect(current_path).to eq("/users/char_prof")
    end
  end
end