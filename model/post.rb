#require 'dm-timestamps'

class Post
  include DataMapper::Resource

  REXP_TAG = /#(\S+)/

  property :id, Serial

  property :posted_at, DateTime
  validates_present :posted_at

  property :message, String, :length => (1..420)

  has n, :taggings
  has n, :tags, :through => :taggings, :mutable => true

  before :save, :create_tags
  after :save, :add_tags

  def time_str
    self.posted_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  def create_tags
    if includes_tag?
      scrape_tags.each do |tag_name|
        if Tag.first(:name => tag_name).nil?
          tag = Tag.create(:name => tag_name)
          raise "failed to save tag" if tag.id.nil?
        end
      end
    end
  end

  def add_tags
    if includes_tag?
      scrape_tags.each do |tag_name|
        tag = Tag.first(:name => tag_name)
        raise "<BUG> tag not found" if tag.nil?

        tagging = Tagging.create(:post => self, :tag => tag)
        raise "failed to save tagging" if tagging.id.nil?
      end
    end
  end

  private

  def includes_tag?
    REXP_TAG =~ self.message
  end

  def scrape_tags
    self.message.scan(REXP_TAG).flatten
  end
end
