require_relative 'restaurant'

class Response
  attr_reader :picked_restaurant, :restaurants, :total_restaurants, :current_user

  def initialize(search_hash, current_user)
    @restaurants = search_hash['businesses'] || []
    @total_restaurants = search_hash['total'] || 0
    @current_user = current_user
    filter_restaurants
    select_restaurant
  end

  def filter_restaurants
    @restaurants.reject! { |restaurant| @current_user.visited_restaurants.include?(restaurant) }
  end

  def select_restaurant
    @picked_restaurant = Restaurant.new(self.restaurants.sample)
  end

end
