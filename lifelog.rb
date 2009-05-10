require 'rubygems'
require 'ramaze'
require 'models.rb'

class MainController < Ramaze::Controller
  map '/'
  engine :Haml

  def index
    @posts = Post.all
  end
end

Ramaze.start :port => 7012
