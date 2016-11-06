class Theater

  attr_accessor :name
  attr_accessor :id
  attr_accessor :address
  attr_accessor :postal_code
  attr_accessor :showtimes_link
  attr_accessor :movies

  def initialize(atts = {})
    atts.each do |att, val|
      send("#{att}=", val)
    end
  end

end
