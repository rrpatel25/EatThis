class AddNameAndUrlToVisitedRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :visited_restaurants, :name, :string
    add_column :visited_restaurants, :url, :string
  end
end
