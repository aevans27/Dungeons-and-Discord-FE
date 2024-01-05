require 'rails_helper'

RSpec.describe 'Home', type: :feature do
  before(:each) do
    # load_test_data
  end
  describe 'GET /' do
    it 'displays the title of the application' do
      visit '/'
      save_and_open_page
      expect(page).to have_content('Dungeons_and_Discord')
    end

    it 'displays a button to create a new user' do
      visit '/'
      expect(page).to have_button('Create New User')
    end

    # it 'sign in using credentials' do
    #   visit '/'
    #   fill_in :name, with: @user1.name
    #   fill_in :password, with: @user1.password
    #   click_on "User Sign In"
    #   expect(current_path).to eq(login_path)
    # end

    # it 'displays a link to go back to the landing page' do
    #   visit '/'
    #   expect(page).to have_link('Go back to Landing Page', href: root_path)
    # end
  end
end