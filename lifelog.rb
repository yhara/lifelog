require 'rubygems'
require 'ramaze'
require 'models.rb'

class MainController < Ramaze::Controller
  map '/'

  def index
  end
end

Ramaze.start :port => 7012
