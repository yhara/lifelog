require 'dm-core'

DataMapper.setup(:default, "sqlite3://posts.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :posted_at, Time
  property :message, String
end
#Post.auto_migrate!

