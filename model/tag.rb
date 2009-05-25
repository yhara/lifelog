class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :taggings
  has n, :post, :through => :taggings, :mutable => true

  validates_is_unique :name
end

class Tagging
  include DataMapper::Resource

  property :id, Serial

  belongs_to :post
  belongs_to :tag
end
