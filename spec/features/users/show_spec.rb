require 'rails_helper'

RSpec.describe 'Users show page' do
  before(:each) do
    load_test_data
  end
    it "should see option to create character" do
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
      expect(current_path).to eq("/users")
      expect(page).to_not have_content("Saving Throws")
    end
end

