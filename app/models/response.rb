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
    visited = current_user.visited_restaurants.pluck(:restaurant_id)
    @restaurants.reject! do |restaurant|
      visited.include?(restaurant['id'])
    end
  end

  def select_restaurant
    p "*" * 90
    p self.restaurants
    p "*" * 90
    @picked_restaurant = Restaurant.new(self.restaurants.sample)
  end

end
