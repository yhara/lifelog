# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lifelog}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yutaka HARA"]
  s.date = %q{2009-07-18}
  s.description = %q{A lifelogging tool written in Ramaze}
  s.email = %q{yutaka.hara/at/gmail.com}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "README.md",
     "Rakefile",
     "VERSION",
     "controller/init.rb",
     "controller/main.rb",
     "layout/default.haml",
     "main.rb",
     "model/init.rb",
     "model/migrations.rb",
     "model/post.rb",
     "model/tag.rb",
     "spec/helper.rb",
     "spec/main.rb",
     "spec/models.rb",
     "view/index.haml"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/yhara/lifelog}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{A lifelogging tool written in Ramaze}
  s.test_files = [
    "spec/helper.rb",
     "spec/main.rb",
     "spec/models.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ramaze>, ["= 2009.06.12"])
      s.add_runtime_dependency(%q<haml>, [">= 0"])
      s.add_runtime_dependency(%q<dm-core>, [">= 0"])
      s.add_runtime_dependency(%q<do_sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<ramaze>, ["= 2009.06.12"])
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<dm-core>, [">= 0"])
      s.add_dependency(%q<do_sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<ramaze>, ["= 2009.06.12"])
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<dm-core>, [">= 0"])
    s.add_dependency(%q<do_sqlite3>, [">= 0"])
  end
end