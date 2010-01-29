require 'rake'
require 'rake/rdoctask'

gem 'rspec-rails', '>= 1.0.0'
require 'spec/rake/spectask'

desc 'Default: run unit tests.'
task :default => :spec

desc 'Test the invision_bridge plugin.'
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ["-c"]
end

desc 'Generate documentation for the invision_bridge plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'InvisionBridge'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name        = "invision_bridge"
    s.summary     = "Uses Authlogic to allow your User model to use an IP.Board 3.x database."
    s.email       = "rspeicher@gmail.com"
    s.homepage    = "http://github.com/tsigo/invision_bridge"
    s.description = "Uses Authlogic to allow your User model to use an IP.Board 3.x database."
    s.authors     = ["Robert Speicher"]
    s.files       = FileList["[A-Za-z]*", "{lib,rails,spec,config}/**/*"]
    s.add_dependency 'authlogic'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
