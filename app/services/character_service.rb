class CharacterService
  def self.conn
    Faraday.new(url: 'https://dungeons-and-discord-be-21zy.onrender.com')
  end
  
  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_url(url, data)
    response = conn.post(url) do |req|
      req.body = data.to_json
      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.delete_at_url(char_id)
    response = conn.delete("/api/v1/characters/#{char_id}")
  end
end
