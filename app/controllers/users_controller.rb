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
    redirect_to controller: 'users', action: 'prof_show', index: params[:index], char_id: new_char[:data][:id]
  end

  def prof_show
    @facade = CharClassFacade.char_class(params[:index])
  end

  def char_prof
    CharacterFacade.create_character('/api/v1/charclasses/add_prof', {
      proficiencies: params[:proficiency_choices]
    })
    redirect_to controller: 'users', action: 'equipment_show', index: params[:index], char_id: params[:char_id]
  end

  def equipment_show
    @facade = CharClassFacade.char_class(params[:index])
  end

  def add_items
    CharacterFacade.create_character('/api/v1/charclasses/add_items', {
      starting_equipment_options: params[:equipment_choices]
    })
    redirect_to controller: 'users', action: 'char_stats', index: params[:index], char_id: params[:char_id]
  end

  def char_stats
    @facade = CharClassFacade.char_class(params[:index])
  end

  def stat_save
   
    new_stats = StatsFacade.create_stats('/api/v1/charclasses/add_stats', {
      user_id: current_user.id,
      str: params[:strength],
      dex: params[:dexterity],
      con: params[:constitution],
      int: params[:intelligence],
      wis: params[:wisdom],
      cha: params[:charisma]
    })
    redirect_to controller: 'users', action: 'char_show', index: params[:index], char_id: params[:char_id]
  end 

  def char_show
    @character = CharacterFacade.get_character(params[:char_id].to_i)
  end

  def char_delete
    character = CharacterFacade.delete_character(params[:char_id])
    redirect_to controller: 'users', action: 'show'
  end

  private
  # def character_params

  #   params.permit(:user_id, :index, :name, :race, :alignment, :authenticity_token, :commit)
  # end
end
