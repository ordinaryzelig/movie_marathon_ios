class Movie

  attr_accessor :title
  attr_accessor :id
  attr_accessor :runtime
  attr_reader   :showtimes

  def initialize(atts = {})
    atts.each do |att, val|
      send("#{att}=", val)
    end
  end

  def showtimes=(_showtimes)
    @showtimes =
      case _showtimes.first
      when Showtime, nil
        _showtimes
      when Hash
        _showtimes.map { |showtime_atts| Showtime.new(showtime_atts) }
      else
        raise "Don't know what to do with Showtimes #{_showtimes.first.class}."
      end
    @showtimes.each do |showtime|
      showtime.movie = self
    end
  end

  def next_showtime(datetime)
    showtimes.detect { |st| datetime < st.feature_start_time }
  end

end
