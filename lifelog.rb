require 'rubygems'
require 'ramaze'

class MainController < Ramaze::Controller
  map '/'

  def index
  end
end

Ramaze.start :port => 7012
