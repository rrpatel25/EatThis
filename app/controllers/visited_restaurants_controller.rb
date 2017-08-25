get '/visited_restaurants/index' do
  authenticate!
  # gather all of the user's visited restaurants and display in list
  @conquered_restaurants = current_user.visited_restaurants
  erb :'visited_restaurants/index'
end
