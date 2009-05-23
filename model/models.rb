#require 'dm-timestamps'

class Post
  include DataMapper::Resource
  property :id, Serial
  property :posted_at, DateTime
  property :message, String

  def time_str
    self.posted_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
