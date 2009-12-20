# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{uchardet}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dmitri Goutnik"]
  s.date = %q{2009-12-20}
  s.default_executable = %q{uchardet}
  s.description = %q{Fast character set encoding detection using International Components for Unicode C++ library.}
  s.email = ["dg@syrec.org"]
  s.executables = ["uchardet"]
  s.extensions = ["ext/uchardet/extconf.rb"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "bin/uchardet", "ext/uchardet/extconf.rb", "ext/uchardet/uchardet.c", "lib/uchardet.rb", "lib/uchardet/cli.rb", "script/console", "script/destroy", "script/generate", "tasks/extconf.rake", "tasks/extconf/uchardet.rake", "test/test_helper.rb", "test/test_uchardet.rb", "test/test_uchardet_cli.rb", "test/test_uchardet_extn.rb"]
  s.homepage = %q{http://rubyforge.org/projects/uchardet/}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib", "ext/uchardet"]
  s.rubyforge_project = %q{uchardet}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Fast character set encoding detection using International Components for Unicode C++ library.}
  s.test_files = ["test/test_helper.rb", "test/test_uchardet.rb", "test/test_uchardet_cli.rb", "test/test_uchardet_extn.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.4.0"])
    else
      s.add_dependency(%q<hoe>, [">= 2.4.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.4.0"])
  end
end
