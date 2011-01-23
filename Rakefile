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
  gem.name = "avataree"
  gem.homepage = "http://github.com/bagwanpankaj/avataree"
  gem.license = "MIT"
  gem.summary = %Q{Ruby DSL for Gravatar profile and images}
  gem.description = %Q{Ruby DSL for Gravatar profile and images}
  gem.email = "bagwanpankaj@gmail.com"
  gem.authors = ["Bagwan Pankaj (a.k.a modulo9)"]
  gem.files = Dir['lib/**/**.rb', 'VERSION', 'bin/**', 'LICENSE.txt']
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "avataree #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end