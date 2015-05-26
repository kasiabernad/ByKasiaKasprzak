class Address
  attr_reader :street_address, :city, :zip, :shipping_street_address, :shipping_city, :shipping_zip
  
  def initialize(street_address, city, zip, shipping_street_address, shipping_city, shipping_zip)
    @street_address = street_address
    @city = city
    @zip = zip
    @shipping_street_address = shipping_street_address
    @shipping_city = shipping_city
    @shipping_zip = shipping_zip
  end
end