# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{andrake}
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yamada Masaki"]
  s.date = %q{2011-07-25}
  s.default_executable = %q{andrake}
  s.description = %q{Andrake is rake tasks for android development}
  s.email = %q{masaki@hisme.net}
  s.executables = ["andrake"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "andrake.gemspec",
    "bin/andrake",
    "lib/andrake.rb",
    "lib/andrake/generator.rb",
    "lib/andrake/generator/rakefile.rb",
    "lib/andrake/manifest.rb",
    "lib/andrake/manifest/version.rb",
    "lib/andrake/tasks.rb",
    "lib/andrake/templates/Rakefile",
    "spec/andrake_spec.rb",
    "spec/generator/rakefile_spec.rb",
    "spec/manifest/AndroidManifest.xml",
    "spec/manifest/manifest_spec.rb",
    "spec/manifest/version_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/masarakki/andrake}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Andrake is rake tasks for android development}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

