require 'rubygems'
require 'ramaze'
require 'models.rb'

class MainController < Ramaze::Controller
  map '/'
  engine :Haml

  def index
    @posts = Post.all(:order => [:posted_at.desc])
  end

  def say
    Post.create({
      :posted_at => Time.now,
      :message => request.params["message"],
    })

    redirect '/'
  end
end

Ramaze.start :port => 7012
