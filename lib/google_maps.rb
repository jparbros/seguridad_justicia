# encoding: UTF-8
module GoogleMaps
  def address_to_google
    URI.encode("http://maps.googleapis.com/maps/api/geocode/json?address=#{parsed_address}&sensor=false")
  end

  def parsed_address
    venue.gsub(/(S|s)alon .*,/,'').gsub('#','').gsub(/código postal/,'').gsub('sin número','').gsub('c.p.','').gsub('Domicilio conocido','').gsub('código póstal','').lstrip.strip
  end

  def options_for_maps
    {address: parsed_address}.to_json
  end

  def geometry
    "#{latitude}, #{longitude}"
  end

  def geolocalizable?
    latitude.present? && longitude.present?
  end
end