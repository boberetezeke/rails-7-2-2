class HelloWorldController < ApplicationController
  def index
    @widgets = Widget.all
  end
end
