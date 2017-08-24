class Address
  attr_reader :address1, :address2, :address3, :city, :state, :zip_code, :country

  def initialize(address_hash)
    @address1 = address_hash['address1']
    @address2 = address_hash['address2']
    @address3 = address_hash['address3']
    @city = address_hash['city']
    @state = address_hash['state']
    @zip_code = address_hash['zip_code']
    @country = address_hash['country']
  end

end
