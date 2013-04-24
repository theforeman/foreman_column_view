$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "foreman_column_view/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = %q{foreman_column_view}
  s.version     = ForemanColumnView::VERSION
  s.authors = ["Greg Sutcliffe"]
  s.email = %q{gsutclif@redhat.com}
  s.email = %q{greg.sutcliffe@gmail.com}
  s.description = %q{Column View Plugin engine for Foreman }
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.homepage = %q{http://github.com/GregSutcliffe/foreman_column_view}
  s.licenses = ["GPL-3"]
  s.summary = %q{Column View Plugin for Foreman}

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "deface"

end
