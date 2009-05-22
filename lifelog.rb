require 'optparse'
require 'rubygems'
require 'ramaze'

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
module LifeLog
  include Innate::Optioned

  options.dsl do
    o "Path of config file", 
      :config, File.expand_path("~/.lifelog.rb") 
    o "Path of database file",
      :db, File.expand_path("~/.lifelog.db")
    o "Port number", 
      :port, 7012
  end
end

OptionParser.new{|o|
  o.on("--config PATH"){|path|
    LifeLog.options[:config] = path
  }
  o.on("--db DB_PATH"){|path| 
    LifeLog.options[:db] = File.expand_path(path, Dir.pwd)
  }
  o.on("--port N"){|port|
    LifeLog.options[:port] = port
  }
  o.on("--help"){ puts o.to_s; exit }
}.parse!(ARGV)

conf = LifeLog.options[:config]
if File.exist?(conf)
  Ramaze::Log.info("Loading config file: #{conf}")
  require conf
else
  Ramaze::Log.warn("Config file not found: #{conf}")
end

Ramaze::Log.info("Loading database: #{LifeLog.options[:db]}")
require 'models.rb'

Ramaze::Log.info("Starting server with port #{LifeLog.options[:port]}")
Ramaze.start :port => LifeLog.options[:port]
