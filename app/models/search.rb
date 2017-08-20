require "json"
require "http"
require "optparse"

class Search

  CLIENT_ID = "c9K_BZY2Myb827P0J_XqBQ"
  CLIENT_SECRET = "ci9MIbndpEQGJwOigmLqQnnibOPIvrraWmlAYxJDrX3VNvavEhYYGBz1xuGvmDYa"

  # Constants, do not change these
  API_HOST = "https://api.yelp.com"
  SEARCH_PATH = "/v3/businesses/search"
  BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
  TOKEN_PATH = "/oauth2/token"
  GRANT_TYPE = "client_credentials"


  DEFAULT_BUSINESS_ID = "yelp-san-francisco"
  DEFAULT_TERM = "dinner"
  DEFAULT_LOCATION = "San Francisco, CA"
  SEARCH_LIMIT = 5


  # def example
  #   client
  #   Yelp.client.check_api_keys
  #   Yelp.client.connection
  #   Yelp.client.search('chicago')
  # end

  def bearer_token
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

  def search(term, location)
    url = "#{API_HOST}#{SEARCH_PATH}"
    # url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
    }

    response = HTTP.auth(bearer_token).get(url, params: params)
    response.parse
  end

end
