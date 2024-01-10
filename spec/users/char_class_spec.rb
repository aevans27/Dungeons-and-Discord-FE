require 'rails_helper'


# This is a mock test that doesn't work any more but can be utlized to start something *shrug*

RSpec.describe 'Characters class page', type: :feature do
  describe "when I visit /char_create" do
    it "I see a page with a text box for a name and a drop down menu of possible classes to pick from. When a
     name is entered and a class is selected, I am taken to a form that shows me saving throws assoeciated with that class " do
      visit '/users/char_class'   
      
      expect(page).to have_content("Name")
      expect(page).to have_field(:name)

      expect(page).to have_content("Select Class")
      expect(page).to have_field(:index)

      fill_in :name, with: 'Shrek'
      select('wizard', from: 'index')
      click_button('Submit')


      expect(current_path).to eq("/users/char_show")

      expect(page).to have_content("Saving Throws")
      # save_and_open_page
      # within(first(".character")) do
      #   expect(page).to have_content("Name: Azula")
      #   expect(page).to have_content("Allies:\nHis")
      #   expect(page).to have_content("Enemies:\nIroh Zuko Kuei Long Feng Mai Ty Lee Ursa")
      #   expect(page).to have_content("Affiliations: Azula's team (formerly) Dai Li (formerly) Fire Nation Fire Nation Royal Family Fire Warriors Royal Fire Academy for Girls (formerly)")
      # end
  
    end
  end
end

