require "json"
require "http"
require "optparse"
require_relative "response"

class YelpHelper

  CLIENT_ID = "c9K_BZY2Myb827P0J_XqBQ"
  CLIENT_SECRET = "ci9MIbndpEQGJwOigmLqQnnibOPIvrraWmlAYxJDrX3VNvavEhYYGBz1xuGvmDYa"

  # Constants, do not change these
  API_HOST = "https://api.yelp.com"
  SEARCH_PATH = "/v3/businesses/search"
  BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
  TOKEN_PATH = "/oauth2/token"
  GRANT_TYPE = "client_credentials"


  DEFAULT_BUSINESS_ID = "yelp-san-francisco"
  DEFAULT_TERM = "restaurants"
  DEFAULT_LOCATION = "Chicago, IL"
  DEFAULT_OFFSET = 0
  SEARCH_LIMIT = 5

  DEFAULT_OPTIONS = {
      term: DEFAULT_TERM,
      location: DEFAULT_LOCATION,
      limit: SEARCH_LIMIT,
      offset: DEFAULT_OFFSET,
      open_now: true
  }


  # def example
  #   client
  #   Yelp.client.check_api_keys
  #   Yelp.client.connection
  #   Yelp.client.search('chicago')
  # end

  def self.bearer_token
    return @bearer_token if @bearer_token
    # Put the url together
    url = "#{API_HOST}#{TOKEN_PATH}"

    raise "Please set your CLIENT_ID" if CLIENT_ID.nil?
    raise "Please set your CLIENT_SECRET" if CLIENT_SECRET.nil?

    # Build our params hash
    params = {
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET,
      grant_type: GRANT_TYPE
    }

    response = HTTP.post(url, params: params)
    parsed = response.parse

    @bearer_token = "#{parsed['token_type']} #{parsed['access_token']}"
  end

  def self.search(args = {})
    options = DEFAULT_OPTIONS.merge(args)
    url = "#{API_HOST}#{SEARCH_PATH}"
    user_id = args[:user_id]

    response = HTTP.auth(bearer_token).get(url, params: options)
    Response.new(response.parse, user_id).picked_restaurant
  end

  def self.get(restaurant_id)
    
  end

end
