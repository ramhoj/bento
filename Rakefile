require 'bundler'
require 'rubygems'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks

desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task :default => :spec
