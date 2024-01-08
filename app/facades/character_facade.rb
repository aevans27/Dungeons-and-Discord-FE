class CharacterFacade
  def self.create_character(route, details)
    x = CharacterService.post_url(route, details)
  end

  def self.get_characters(user_id)
    json_response = CharacterService.get_url("/api/v1/characters", user_id)
    classes = json_response[:results].map do |result|
      Charclass.new(result)
    end
  end
end