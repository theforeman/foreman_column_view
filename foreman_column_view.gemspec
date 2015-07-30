$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "foreman_column_view/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = %q{foreman_column_view}
  s.version     = ForemanColumnView::VERSION
  s.authors = ["Greg Sutcliffe"]
  s.email = "greg.sutcliffe@gmail.com"
  s.description = "Displays an additional column in the Foreman Hosts view
  and/or additional entries in the Host show page"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = Dir["{app,extra,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
  s.homepage = "http://github.com/GregSutcliffe/foreman_column_view"
  s.licenses = ["GPL-3"]
  s.summary = "Column View Plugin for Foreman"

  s.add_dependency "deface", "< 2.0"
end

