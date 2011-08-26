# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bento/version'

Gem::Specification.new do |s|
  s.name = "bento"
  s.rubyforge_project = "bento"
  s.version = Bento::VERSION

  s.authors = ["Nicklas Ramhöj", "Jonas Nicklas"]
  s.email = ["ramhoj@gmail.com"]
  s.description = "A Rails account management engine"

  s.files = Dir.glob("{lib,spec}/**/*") + %w(README.rdoc)
  s.extra_rdoc_files = ["README.rdoc"]

  s.homepage = "http://github.com/ramhoj/bento"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.3.6"
  s.summary = "A Rails account management engine"

  s.add_development_dependency("rspec-rails",      ["~> 2.6.1"])
  s.add_development_dependency("sqlite3-ruby",     ["~> 1.3"])
  s.add_development_dependency("capybara",         ["~> 1.0"])
  s.add_development_dependency("cucumber-rails",   ["~> 1.0"])
  s.add_development_dependency("database_cleaner", ["~> 0.6"])
  s.add_development_dependency("launchy",          ["~> 0.3"])
  s.add_development_dependency("devise",           ["~> 1.4.2"])
  s.add_development_dependency("machinist",        ["~> 1.0"])
  s.add_development_dependency("ffaker",           ["~> 0.4"])
  s.add_development_dependency("mocha",            ["~> 0.9"])
  s.add_development_dependency("elabs_matchers",   ["~> 0.0.2"])

  s.add_dependency("rails",                        ["~> 3.0"])
  s.add_dependency("simple_form",                  ["~> 1.4"])
  s.add_dependency("inherited_resources",          ["~> 1.2.2"])
  s.add_dependency("table_for",                    ["~> 0.0.2"])
  s.add_dependency("show_for",                     ["~> 0.2"])
end
