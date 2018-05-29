require 'bundler/gem_tasks'
require 'rake/extensiontask'
require 'rake/testtask'

GEMSPEC = Gem::Specification.load("uchardet.gemspec")

# Rake::ExtensionTask.new(:uchardet_ext) do |t|
#   t.lib_dir = 'lib/uchardet'
# end

Rake::ExtensionTask.new(:uchardet_ext, GEMSPEC) do |t|
  t.ext_dir = 'ext'
end

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task build: :compile
task test: :compile

task default: :test
