post '/restaurants' do
  authenticate!
  # logic for storing a restaurant in a user's list of visited restaurants

  # Generate a new restaurant from new_restaurant = YelpHelper.search(user_id: current_user.id)
  # store the new restaurant in VisitedRestaurant
    # done with current_user.visited_restaurants << new_restaurant
  # if request.xhr?
    # if current_user.visited_restaurants << new_restaurant
      # send back the _restaurant_display of the new restaurant_info
      # add it to the index page on the promise.done
    # else
      # send back an error_message
    # end
  # else
    # if current_user.visited_restaurants << new_restaurant
      # go to the visited_restaurant show page (containing _restaurant_display)
    # else
      # render the _errors partial
    # end
  # end
end
