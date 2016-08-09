class Movie

  attr_accessor :title
  attr_accessor :id
  attr_accessor :runtime
  attr_reader   :showtimes

  def showtimes=(_showtimes)
    @showtimes = _showtimes
    @showtimes.each do |showtime|
      showtime.movie = self
    end
    @showtimes
  end

  def next_showtime(datetime)
    showtimes.detect { |st| datetime < st.feature_start_time }
  end

end
