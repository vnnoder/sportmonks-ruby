require 'httparty'

class Sportmonks::Api
  include HTTParty

  base_uri "https://soccer.sportmonks.com/api/v2.0"

  def self.api_get(path, query_opts = {})
    query_opts = query_opts.merge({api_token: Sportmonks.configuration.api_token})
    resp = self.get(path, headers: headers(), query: query_opts)
    if resp.success?
      JSON.parse(resp.body)
    else
      resp
    end
  rescue NoMethodError
    raise ArgumentError, """
    Please configure an api token
    Sportmonks.configure do |config|
      config.api_token = 'your_api_key'
    end
    """
  end

  def self.headers()
    {'Content-Type' => 'application/json'}
  end
end
