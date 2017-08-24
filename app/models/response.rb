require_relative 'restaurant'

class Response
  attr_reader :picked_restaurant, :restaurants, :total_restaurants

  def initialize(search_hash)
    @restaurants = search_hash['businesses'] || []
    @total_restaurants = search_hash['total'] || 0
    select_restaurant
  end

  def select_restaurant
    @picked_restaurant = Restaurant.new(self.restaurants.sample)
  end

end
