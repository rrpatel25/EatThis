class Restaurant
  attr_reader :restaurant_id, :name, :is_closed, :rating, :price, :address, :phone_number, :image_url

  def initialize(restaurant_info = {})
    @restaurant_id = restaurant_info['id'] || nil # throw error if id is missing
    @name = restaurant_info['name'] || "n/a"
    @is_closed = restaurant_info['is_closed']
    @rating = restaurant_info['rating'] || 'n/a'
    @price = restaurant_info['price'] || 'n/a'
    @address = Address.new(restaurant_info['location']) || 'n/a'
    @phone_number = restaurant_info['display_phone'] || 'n/a'
    @image_url = restaurant_info['image_url']
  end

end
