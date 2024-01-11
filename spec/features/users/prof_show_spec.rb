require 'rails_helper'


# This is a mock test that doesn't work any more but can be utlized to start something *shrug*

RSpec.describe 'Characters profession page', type: :feature do
  before(:each) do
    load_test_data
  end
  describe "when I get to /prof_create" do
    it "I see a page with a selection of proffession having to do with my class selection " do
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