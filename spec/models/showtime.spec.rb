require_relative 'helper'

describe Showtime do

  it 'considers preview time to calculate feature_start_time, feature_end_time' do
    movie             = Movie.new
    movie.runtime     = 120
    showtime          = Showtime.new
    showtime.datetime = DateTime.new(2016, 8, 4, 12)
    movie.showtimes   = [showtime]

    showtime.feature_start_time.must_equal DateTime.new(2016, 8, 4, 12, 20)
    showtime.feature_end_time  .must_equal DateTime.new(2016, 8, 4, 14, 20)
  end

end
