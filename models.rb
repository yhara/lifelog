require 'rubygems'
require 'dm-core'

DataMapper.setup(:default, "sqlite3://#{File.expand_path(File.dirname __FILE__)}/posts.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :posted_at, DateTime
  property :message, String

  def time_str
    self.posted_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
Post.auto_upgrade!
