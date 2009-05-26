# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lifelog}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yutaka HARA"]
  s.date = %q{2009-05-26}
  s.default_executable = %q{lifelog}
  s.description = %q{A lifelogging tool written in Ramaze}
  s.email = %q{yutaka.hara/at/gmail.com}
  s.executables = ["lifelog"]
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "README.md",
     "Rakefile",
     "VERSION",
     "bin/lifelog",
     "controller/init.rb",
     "controller/main.rb",
     "layout/default.ges",
     "lifelog.gemspec",
     "model/init.rb",
     "model/migrations.rb",
     "model/post.rb",
     "model/tag.rb",
     "view/index.ges"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/yhara/lifelog}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{A lifelogging tool written in Ramaze}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ramaze>, ["= 2009.05"])
      s.add_runtime_dependency(%q<dm-core>, [">= 0"])
      s.add_runtime_dependency(%q<do_sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<ramaze>, ["= 2009.05"])
      s.add_dependency(%q<dm-core>, [">= 0"])
      s.add_dependency(%q<do_sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<ramaze>, ["= 2009.05"])
    s.add_dependency(%q<dm-core>, [">= 0"])
    s.add_dependency(%q<do_sqlite3>, [">= 0"])
  end
end
