class VisitedRestaurant < ActiveRecord::Base

  validates_presence_of :visitor_id, :restaurant_id

  belongs_to :visitor, class_name: :User, foreign_key: :visitor_id
  has_one :restaurant

end
