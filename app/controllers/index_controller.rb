get '/' do
  erb :'/index'
  # @restaurant = YelpHelper.search(user_id: 104)
  # erb :'restaurants/_restaurant_display', locals: { restaurant: @restaurant }
end
