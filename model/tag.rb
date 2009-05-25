class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  validates_is_unique :name
  validates_length :name, :max => 1000

  has n, :taggings
  has n, :post, :through => :taggings, :mutable => true
end

class Tagging
  include DataMapper::Resource

  property :id, Serial

  belongs_to :post
  belongs_to :tag
end
