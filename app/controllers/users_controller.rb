class UsersController < ApplicationController

  def show
    @characters = CharacterFacade.get_characters(session[:user_id])
  end

  def char_create
    # new_char = CharacterFacade.create
  end
  
  def char_save
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

  def prof_show
    @facade = CharClassFacade.char_class(params[:index])
    # @char_class = facade.char_class
  end

  def char_prof
    CharacterFacade.create_character('/api/v1/charclasses/add_prof', {
      proficiencies: params[:proficiency_choices]
    })
    redirect_to controller: 'users', action: 'equipment_show', index: params[:index]
  end

  def equipment_show
    @facade = CharClassFacade.char_class(params[:index])
  end

  def add_items
    CharacterFacade.create_character('/api/v1/charclasses/add_items', {
      starting_equipment_options: params[:equipment_choices]
    })
    redirect_to controller: 'users', action: 'char_stats', index: params[:index]
  end

  def char_stats
    require 'pry';binding.pry
    @facade = CharClassFacade.char_class(params[:index])
  end

  def stat_save
    new_stats = StatsFacade.create_stats('/api/v1/charclasses/add_stats', {
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
