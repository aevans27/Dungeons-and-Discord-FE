class CharacterFacade
  def self.create_character(route, details)
    x = CharacterService.post_url(route, details)
  end

  def self.get_characters(user_id)
    json_response = CharacterService.get_url("/api/v1/characters?user_id=#{user_id}")
    characters = json_response[:data].map do |result|
      Character.new(result)
    end
  end

  def self.get_character(character_id)
    json_response = CharacterService.get_url("/api/v1/characters/#{character_id}")
    Character.new(json_response[:data])
  end
end