class ShowtimesScreen < PM::TableScreen
  title "Your title here"
  stylesheet ShowtimesScreenStylesheet

  attr_accessor :movie_ids

  def on_load
  end

  def table_data
    [{
      cells: movies.map do |movie|
        {
          title:    movie.fetch(:title),
          subtitle: movie.fetch(:subtitle),
        }
      end
    }]
  end

private

  def movies
    @movies ||= MoviesScreen::MOVIES.values_at(*movie_ids)
  end
end
