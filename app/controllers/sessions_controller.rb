require 'nokogiri' 

class SessionsController < ApplicationController
  def create
    client_id = Rails.application.credentials.discord[:client_id]
    client_secret = Rails.application.credentials.discord[:secret]
    redirect_uri = "http://[::1]:5000/user/auth/discord/callback"
    code = params[:code]
  
    # conn = Faraday.new(url: 'https://discord.com', headers: {
    #   'Content-Type': 'application/x-www-form-urlencoded'
    # })
    
    # response = conn.post('/api/oauth2/token') do |req|
    #   req.params['code'] = code
    #   req.params['client_id'] = client_id
    #   req.params['client_secret'] = client_secret
    # end

    data = {
      "grant_type" => "authorization_code",
      "code" => code,
      "client_id" => client_id.to_s,
      "client_secret" => client_secret,
      "redirect_uri" => redirect_uri
    }

    url = 'https://discord.com/api/oauth2/token'

    response = Faraday.post(url) do |req|
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.headers['Accept'] = 'application/json'
      req.body = URI.encode_www_form(data)
    end

    data = JSON.parse(response.body, symbolize_names: true)
    access_token = data[:access_token]
    
    conn = Faraday.new(
      headers: {
        Authorization: "Bearer #{access_token}"
      }
    )
    url2 = 'https://discord.com/api/users/@me'
    response = conn.get(url2)
    data = JSON.parse(response.body, symbolize_names: true)
    # binding.pry

    user          = User.find_or_create_by(uid: data[:id])
    user.username = data[:username]
    user.uid      = data[:id]
    user.token    = access_token
    user.save

    session[:user_id] = user.id
    
    redirect_to "/users"
  end

  def dummy_test
    user          = User.find_or_create_by(uid: 123)
    user.username = "bubba"
    user.uid      = "123"
    user.token    = "password123"
    user.save

    session[:user_id] = user.id
    
    redirect_to "/users"
  end
end