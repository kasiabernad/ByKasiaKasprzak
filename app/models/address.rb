class Address
  attr_reader :street_address, :city, :zip
  
  def initialize(street_address, city, zip)
    @street_address = street_address
    @city = city
    @zip = zip
  end
end