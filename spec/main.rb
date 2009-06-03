require 'spec/helper.rb'
ARGV.concat ["--db", "test.db"]
load 'bin/lifelog'

describe Main do
  behaves_like :rack_test

  # index

  it 'shows start page' do
    get('/').status.should == 200
    #last_response.should =~ /<h1>Welcome to Ramaze!<\/h1>/
  end

  # posting

  it 'accepts a post' do
    post('/say', :message => "This is test").status.should == 302
    follow_redirect!
    last_response.should =~ /This is test/
  end

  it 'should not create a post via GET method' do
    lambda{
      get('/say?message=test')
    }.should.not.change{ Post.count }
  end

  # searching by tags

  it 'searches tagged posts' do
    post('/say', :message => "#foo test1")
    post('/say', :message => "#foo test2")
    post('/say', :message => "#bar test3")

    get('/search/tag/foo')
    last_response.should =~ /test1/
    last_response.should =~ /test2/
    last_response.should.not =~ /test3/
  end
end
