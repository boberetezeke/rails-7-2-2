class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all

    search = widget_params[:search]
    color = widget_params[:widget_color]&.to_sym
    @widgets = @widgets.where("name like '%#{connection.quote(search)[1..-2]}%'") if search
    @widgets = @widgets.where(color: color) if color && Widget::COLORS_HASH.invert.include?(color)

    sort_by_param = widget_params[:sort_by]
    if sort_by_param && Widget::SORTS.include?(sort_by_param)
      sort_by = sort_by_param
    else
      sort_by = :name
    end

    sort_dir_param = widget_params[:sort_dir]
    if sort_dir_param && Widget::SORT_DIRS.include?(sort_dir_param)
      sort_dir = sort_dir_param
    else
      sort_dir = "asc"
    end

    @widgets = @widgets.order("#{sort_by} #{sort_dir}")
  end

  def widget_params
    params.permit(:widget_color, :search, :sort_by, :sort_dir)
  end
end