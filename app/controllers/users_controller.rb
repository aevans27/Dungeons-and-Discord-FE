class UsersController < ApplicationController

  def show
    @characters = CharacterFacade.get_characters(session[:user_id])
  end

  def char_create
    # new_char = CharacterFacade.create
  end

  def prof_show
    @facade = CharClassFacade.char_class(params[:index])
    # @char_class = facade.char_class
  end

  def char_prof
  end

  def char_save
    # binding.pry
    new_char = CharacterFacade.create_character('/api/v1/characters', {
      user_id: current_user.id,
      name: params[:name],
      char_class: params[:index],
      race: params[:race],
      background: 'Acolyte',
      alignment: params[:alignment]
    })
    redirect_to controller: 'users', action: 'prof_show', index: params[:index]
    # redirect_to "/users/prof_show", index: params[:index]
  end

  def char_stats
  end

  def stat_save
    new_stats = StatsFacade.create_stats('/api/v1/', {
      user_id: current_user.id,
      strength: params[:strength],
      dexterity: params[:dexterity],
      constitution: params[:constitution],
      intelligence: params[:intelligence],
      wisdom: params[:widsom],
      charisma: params[:charisma]
    })
    redirect_to controller: 'users', action: 'char_show' 
  end 

  def char_show
    #need the final call for a character associated with this specific user and character
  end

  private



  # def character_params

  #   params.permit(:user_id, :index, :name, :race, :alignment, :authenticity_token, :commit)
  # end
end
