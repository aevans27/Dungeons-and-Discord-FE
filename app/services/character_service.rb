class CharacterService
  def self.conn
    Faraday.new(url: 'http://localhost:3000')
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
end
