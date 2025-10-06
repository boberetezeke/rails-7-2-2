class WidgetController < ApplicationController
  def index
    @widgets = Widget.all

    @widgets = @widgets.where("name like '%#{connection.quote(search)[1..-2]}%'") if params[:search]
    @widgets = @widgets.where(color: params[:color]) if params[:color] && Widget::COLORS_HASH.invert.include?(params[:color])

    if params[:sort_by] && Widget::SORTS.include?(params[:sort_by])
      sort_by = params[:sort_by]
    else
      sort_by = :name
    end
    if params[:sort_dir] && Widget::SORT_DIRS.include?(params[:sort_dir])
      sort_dir = params[:sort_dir]
    else
      sort_dir = "asc"
    end

    @widgets = @widgets.order("#{sort_by} #{sort_dir}")
  end
end