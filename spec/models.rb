require 'spec/helper.rb'
module LifeLog
  include Innate::Optioned

  options.dsl do
    o "Path of database file (for test)",
      :db, "test.db"
  end
end
require 'model/init.rb'

describe Post do
  # init
 
  it 'does not exist at first' do
    Post.all.should == []
  end

  # instantiation

  it 'should create instance for valid data' do
    lambda{
      Post.create({
        :posted_at => Time.now,
        :message => "test",
      })
    }.should.change{ Post.count }
  end

  it 'should make tags for tagged message' do
    post = Post.create({
      :posted_at => Time.now,
      :message => "#foo #bar test",
    })
    foo = Tag.first(:name => "foo")
    bar = Tag.first(:name => "bar")

    [foo, bar].each{|tag| tag.should.not == nil}
    post.tags.should == [foo, bar]
  end
end

describe Tag do
  it 'should check uniqueness' do
    Tag.create(:name => "foo")
    Tag.create(:name => "foo").id.should == nil
  end
end
