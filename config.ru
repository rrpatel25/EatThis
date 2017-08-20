# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)
require 'yelp'

set :app_file, __FILE__

run Sinatra::Application




                        #   {
                        #     "access_token": "aMuPXttIv18HUviC1znCrTXFwjCoMlZB-3UkUg0gNXqfwWZwWZClg1QIHss3Zha91I8p-maTQIML-0pnG6OfCE-8JFzav2_GTtz6I5JwBV-Kqov-zxU4eKhispWYWXYx",
                        #     "expires_in": 15551999,
                        #     "token_type": "Bearer"
                        # }
