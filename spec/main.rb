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

#  it 'should not accept a post not via POST method' do
#    get('/say?message=test').status.should != 200
#  end
end
