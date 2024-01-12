require 'rails_helper'

RSpec.describe 'Characters equipment page', type: :feature do
  before(:each) do
    load_test_data
  end
  describe "when I get to /equipment_show" do
    it "I see a page with a selection of equipment having to do with my class selection " do
      first_response = File.read('spec/fixtures/first_char.json')
      wizard_response = File.read('spec/fixtures/wizard_class.json')
      error_response = File.read('spec/fixtures/error_prof.json')
      # stub_request(:get, "http://localhost:3000/api/v1/characters?user_id=#{@current_user.id}").
      #    with(
      #      headers: {
      #     'Accept'=>'*/*',
      #     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #     'User-Agent'=>'Faraday v2.9.0'
      #      }).
      #    to_return(status: 200, body: first_response, headers: {})

      #    stub_request(:post, "http://localhost:3000/api/v1/characters").
      #    with(
      #      body: "{\"user_id\":#{@current_user.id},\"name\":\"Shrek\",\"char_class\":\"wizard\",\"race\":\"tiefling\",\"background\":\"Acolyte\",\"alignment\":\"lawful good\"}",
      #      headers: {
      #     'Accept'=>'*/*',
      #     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #     'Content-Type'=>'application/json',
      #     'User-Agent'=>'Faraday v2.9.0'
      #      }).
      #    to_return(status: 200, body: "[]", headers: {})

      #    stub_request(:get, "http://localhost:3000/api/v1/charclasses/wizard").
      #    with(
      #      headers: {
      #     'Accept'=>'*/*',
      #     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #     'User-Agent'=>'Faraday v2.9.0'
      #      }).
      #    to_return(status: 200, body: wizard_response, headers: {})

      #    stub_request(:post, "http://localhost:3000/api/v1/charclasses/add_prof").
      #    with(
      #      body: "{\"proficiencies\":[\"Skill: Arcana\",\"Skill: History\"]}",
      #      headers: {
      #     'Accept'=>'*/*',
      #     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #     'Content-Type'=>'application/json',
      #     'User-Agent'=>'Faraday v2.9.0'
      #      }).
      #    to_return(status: 400, body: error_response, headers: {})

      #    stub_request(:post, "http://localhost:3000/api/v1/charclasses/add_items").
      #    with(
      #      body: "{\"starting_equipment_options\":[\"Dagger\",\"arcane focus\",\"Explorer's Pack\"]}",
      #      headers: {
      #     'Accept'=>'*/*',
      #     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #     'Content-Type'=>'application/json',
      #     'User-Agent'=>'Faraday v2.9.0'
      #      }).
      #    to_return(status: 400, body: error_response, headers: {})

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

      expect(current_path).to eq("/users/equipment_show")
      expect(page).to have_content("Choose between (a) a quarterstaff or (b) a dagger:")
      expect(page).to have_content("Character Equipment for WIZARD")
      expect(page).to have_content("Equipment Choices (Choose one of each):")

      find(:xpath, "(//input[@type='checkbox'])[2]").check
      find(:xpath, "(//input[@type='checkbox'])[4]").check
      find(:xpath, "(//input[@type='checkbox'])[6]").check
      click_button('Submit')
      expect(current_path).to eq("/users/char_stats")
    end
  end
end