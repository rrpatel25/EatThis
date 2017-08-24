require_relative 'restaurant'
require_relative 'user'
require_relative 'visited_restaurant'

class Response
  attr_reader :picked_restaurant, :restaurants, :total_restaurants, :current_user

  def initialize(search_hash, user_id)
    @restaurants = search_hash['businesses'] || []
    @total_restaurants = search_hash['total'] || 0
    @current_user = User.find(user_id)
    filter_restaurants
    select_restaurant
  end

  def filter_restaurants
    self.restaurants.reject! { |restaurant| current_user.visited_restaurants.include?(restaurant) }
  end

  def select_restaurant
    @picked_restaurant = Restaurant.new(self.restaurants.sample)
  end

end
