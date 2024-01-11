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
    CharacterFacade.create_character('/api/v1/charclasses/add_prof', {
      user_id: current_user.id,
      name: params[:name],
      char_class: params[:index],
      race: params[:race],
      background: 'Acolyte',
      alignment: params[:alignment]
    })
    redirect_to controller: 'users', action: 'equipment_show', index: params[:class]
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

  def equipment_show
    @facade = CharClassFacade.char_class(params[:index])
  end

  private



  # def character_params

  #   params.permit(:user_id, :index, :name, :race, :alignment, :authenticity_token, :commit)
  # end
end
