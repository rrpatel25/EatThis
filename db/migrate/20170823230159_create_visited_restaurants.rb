class CreateVisitedRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :visited_restaurants do |t|
      t.integer :visitor_id, null: false
      t.integer :restaurant_id, null: false

      t.timestamps
    end
  end
end
