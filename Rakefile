# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "foreman_column_view"
  gem.homepage = "http://github.com/GregSutcliffe/foreman_column_view"
  gem.license = "GPL-3"
  gem.summary = %Q{Column View Plugin for Foreman }
  gem.description = %Q{Displays an additional column in the Foreman Hosts view}
  gem.email = "greg.sutcliffe@gmail.com"
  gem.authors = ["Greg Sutcliffe"]
  # dependencies defined in Gemfile
end

task :default => :test
