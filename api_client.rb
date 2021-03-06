require 'faraday'
require 'oj'

client = Faraday.new(url: 'http://localhost:3000') do |config|
    config.adapter  Faraday.default_adapter
    config.token_auth('dc431c3980eede8c781bae0c42f150e5')
  end

  # response = client.post do |req|
  #   req.url '/api/v1/users'
  #   req.headers['Content-Type'] = 'application/json'
  #   req.body = '{ "user": {"name": "Nicolas Osorio"} }'
  # end


  # response = client.post do |req|
  #   req.url '/api/v1/tweets'
  #   req.headers['Content-Type'] = 'application/json'
  #   req.body = '{ "tweet": {"title": "Prueba", "body":"Texto de prueba"} }'
  # end


  response = client.delete do |req|
    req.url '/api/v1/tweets/15'
    req.headers['Content-Type'] = 'application/json'
  end

  puts Oj.load(response.body)
  puts "STATUS:"
  puts response.status
