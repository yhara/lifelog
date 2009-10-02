begin
  require 'jeweler'
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Jeweler::Tasks.new do |gemspec|
  gemspec.name = "lifelog"
  gemspec.summary = "A lifelogging tool written in Ramaze"
  gemspec.email = "yutaka.hara/at/gmail.com"
  gemspec.homepage = "http://github.com/yhara/lifelog"
  gemspec.description = gemspec.summary
  gemspec.authors = ["Yutaka HARA"]
  gemspec.add_dependency('ramaze', '= 2009.10')
  gemspec.add_dependency('do_sqlite3', '= 0.10.0')
  gemspec.add_dependency('dm-core', '= 0.10.1')
  gemspec.add_dependency('dm-validations', '= 0.10.1')
  gemspec.add_dependency('dm-aggregates', '= 0.10.1')
end

desc "install current source as gem"
task :dogfood => [:gemspec, :build] do
  sh "sudo gem install pkg/lifelog-#{File.read("VERSION").chomp}.gem"
end

desc "uninstall temporary gem and install from github"
task :nodogfood do
  sh "sudo gem uninstall lifelog"
  sh "sudo gem install yhara-lifelog"
end

desc "check for gem to be built"
task :stalk do
  sh "gemstalk yhara lifelog"
end
