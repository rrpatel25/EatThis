class User < ActiveRecord::Base

  validates_presence_of :email, :hashed_password
  validates_uniqueness_of :email
  validate :password_length

  has_many :visited_restaurants, foreign_key: :visitor_id

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @plain_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def password_length
    errors.add(:password, 'must be at least 7 characters long') unless @plain_password.length >= 6
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end

end
