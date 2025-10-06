class Widget < ActiveRecord::Base
  # this defines which colors to filter by
  COLORS_HASH = {
    "Blue" => :blue,
    "Red" => :red,
    "Green" => :green
  }

  SORTS_HASH = {
    "Name" => :name,
    "Color" => :color
  }
  SORTS = SORTS_HASH.values.map(&:to_s)

  SORT_DIRS_HASH = {
    "Ascending" => :asc,
    "Descending" => :desc,
  }
  SORT_DIRS = SORT_DIRS_HASH.values.map(&:to_s)

  # This defines the names of the filters and their default values
  TABLE_FILTERS = {
    search: '',
    widget_color: 'red',
    sort_by: 'name',
    sort_dir: 'asc'
  }
end