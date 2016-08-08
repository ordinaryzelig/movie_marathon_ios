class MoviesScreen < PM::TableScreen
  title 'Select Movies'
  stylesheet MoviesScreenStylesheet

  MOVIES = [
    {title: 'Cafe Society',     subtitle: '96 minutes',  action: :toggle},
    {title: 'Jason Bourne',     subtitle: '123 minutes', action: :toggle},
    {title: 'Star Trek Beyond', subtitle: '122 minutes', action: :toggle},
  ]

  def on_load
    @selected_movies_ids = []
    set_nav_bar_button :right, title: 'See Showtimes', action: :see_showtimes
  end

  def table_data
    [{
      cells: MOVIES.each_with_index.map do |movie, idx|
        {
          title:    movie.fetch(:title),
          subtitle: movie.fetch(:subtitle),
          action:    :toggle,
          arguments: {id: idx},
          accessory_type: :checkmark,
        }
      end
    }]
  end

  def toggle(args, index_path)
    movie_id = args.fetch(:id)
    cell = tableView(nil, cellForRowAtIndexPath: index_path)
    if @selected_movies_ids.delete(movie_id)
      cell.accessoryType = UITableViewCellAccessoryNone
    else
      @selected_movies_ids << movie_id
      cell.accessoryType = UITableViewCellAccessoryCheckmark
    end
  end

  def see_showtimes
    open ShowtimesScreen.new(movie_ids: @selected_movies_ids)
  end
end
