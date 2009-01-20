Gem::Specification.new do |s|
  s.name = %q{rglob}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Hooper"]
  s.date = %q{2009-01-20}
  s.description = %q{Glob-syntax pattern matching}
  s.email = %q{adam@adamhooper.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/rglob.rb"]
  s.files = ["README.rdoc", "Rakefile", "test/rglob/glob_test.rb", "lib/rglob.rb", "Manifest", "rglob.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/adamh/rglob}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Rglob", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rglob}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Glob-syntax pattern matching}
  s.test_files = ["test/rglob/glob_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
