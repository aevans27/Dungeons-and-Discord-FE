class StatsFacade
  def self.create_character(route, details)
    x = CharacterService.post_url(route, details)
  end


  def self.create_stats
    json_response = CharacterService.get_url("/api/v1//#{index}")
    character = Stats.new(json_response[:data])
    # require 'pry';binding.pry
    # characters = json_response[:data].map do |key, value|
    #   require 'pry';binding.pry
    #   Charclass.new([:data])
    # end
  end
end