get '/visited_restaurants/new' do
  # gather all of the user's visited restaurants and display in list
  erb :'visited_restaurants/index'
end
