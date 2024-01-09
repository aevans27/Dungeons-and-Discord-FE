class UsersController < ApplicationController

  def show
    @characters = CharacterFacade.get_characters(session[:user_id])
  end
end