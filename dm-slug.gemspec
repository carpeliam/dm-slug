# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dm-slug}
  s.version = "0.9.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Liam Morley"]
  s.date = %q{2008-12-14}
  s.description = %q{Manages your slug so you don't have to.}
  s.email = ["liam@carpeliam.com"]
  s.extra_rdoc_files = ["README.markdown", "LICENSE", "TODO"]
  s.files = ["History.txt", "LICENSE", "Manifest.txt", "README.markdown", "Rakefile", "TODO", "lib/dm-slug.rb", "lib/dm-slug/has/slug.rb", "lib/dm-slug/has/version.rb", "spec/integration/slug_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/hoe.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://www.github.com/carpeliam/dm-slug/tree/master}
  s.rdoc_options = ["--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{dm-slug}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Manages your slug so you don't have to.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, ["= 0.9.8"])
      s.add_runtime_dependency(%q<dm-validations>, ["= 0.9.8"])
      s.add_runtime_dependency(%q<dm-types>, ["= 0.9.8"])
    else
      s.add_dependency(%q<dm-core>, ["= 0.9.8"])
      s.add_dependency(%q<dm-validations>, ["= 0.9.8"])
      s.add_dependency(%q<dm-types>, ["= 0.9.8"])
    end
  else
    s.add_dependency(%q<dm-core>, ["= 0.9.8"])
    s.add_dependency(%q<dm-validations>, ["= 0.9.8"])
    s.add_dependency(%q<dm-types>, ["= 0.9.8"])
  end
end
