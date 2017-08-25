post '/restaurants' do
  authenticate!
  # logic for storing a restaurant in a user's list of visited restaurants

  # Generate a new restaurant
  @suggested_restaurant = YelpHelper.search(user_id: current_user.id)
  # store the new restaurant in VisitedRestaurant
    # done with current_user.visited_restaurants << new_restaurant
  if request.xhr?
    if current_user.visited_restaurants << @suggested_restaurant
      # send back the _restaurant_display of the new restaurant_info
      erb :'_restaurant_display', locals: { restaurant: @suggested_restaurant }
      # add it to the index page on the promise.done
    else
      @errors = @suggested_restaurant.errors.full_messages
      erb :'_errors', layout: false
    end
  else
    if current_user.visited_restaurants << @suggested_restaurant
      # go to the visited_restaurant show page (containing _restaurant_display)
      redirect "/restaurants/#{:id}/show"
    else
      @errors = @suggested_restaurant.errors.full_messages
      redirect '/404'
    end
  end
end
