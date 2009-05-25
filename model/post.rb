#require 'dm-timestamps'

class Post
  include DataMapper::Resource

  REXP_TAG = /#(\S+)/

  property :id, Serial
  property :posted_at, DateTime
  property :message, String

  validates_length :message, :max => 1000

  has n, :taggings
  has n, :tags, :through => :taggings, :mutable => true

  def time_str
    self.posted_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  private

  def includes_tag?
    REXP_TAG =~ self.message
  end

  def scrape_tags
    self.message.scan(REXP_TAG).flatten
  end
end
