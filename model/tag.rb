class Tag
  include DataMapper::Resource

  property :id, Serial

  property :name, String, :length => (1..100)
  validates_is_unique :name

  has n, :taggings
  has n, :post, :through => :taggings, :mutable => true
end

class Tagging
  include DataMapper::Resource

  property :id, Serial

  belongs_to :post
  belongs_to :tag

  validates_with_block do
    if Tagging.first(:post_id => post_id, :tag_id => tag_id)
      [false, "Tagging for (#{post_id}, #{tag_id}) already exists"]
    else
      true
    end
  end

end
