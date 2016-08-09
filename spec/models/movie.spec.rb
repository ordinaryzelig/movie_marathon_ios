require_relative 'helper'

describe Movie do

  it 'assigns self when showtimes assigned' do
    movie = Movie.new
    showtime = Showtime.new
    movie.showtimes = [showtime]
    showtime.movie.must_equal movie
  end

  describe '#next_showtime' do

    it 'returns the next possible Showtime after given DateTime' do
      movie = Movie.new
      movie.showtimes = [10, 12].map do |hour|
        showtime = Showtime.new
        showtime.datetime = DateTime.new(2016, 8, 6, hour)
        showtime
      end

      next_showtime = movie.next_showtime(DateTime.new(2016, 8, 6, 11))
      next_showtime.datetime.must_equal DateTime.new(2016, 8, 6, 12)
    end

    it 'returns the next possible Showtime, disregarding assumed preview times' do
      showtime = Showtime.new
      showtime.datetime = DateTime.new(2016, 8, 6, 12)
      movie = Movie.new
      movie.showtimes = [showtime]

      next_showtime = movie.next_showtime(showtime.datetime)
      next_showtime.must_equal showtime
    end

  end

end
