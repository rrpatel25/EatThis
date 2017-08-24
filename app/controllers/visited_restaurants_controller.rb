get '/visited_restaurants/index' do
  # gather all of the user's visited restaurants and display in list


  erb :'visited_restaurants/index'
end

get '/visited_restaurants/new' do
  # is this the home page with the button to click?
  erb :'visited_restaurants/index'
end
