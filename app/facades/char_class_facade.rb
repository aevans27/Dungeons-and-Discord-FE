class CharClassFacade
  def self.create_character(route, details)
    x = CharacterService.post_url(route, details)
  end


  def self.char_class(index)
    json_response = CharacterService.get_url("/api/v1/charclasses/#{index}")
    class_info = Charclass.new(json_response[:data])
    # characters = json_response[:data].map do |key, value|
    #   Charclass.new([:data])
    # end
  end
end