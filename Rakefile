require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/uchardet'

Hoe.plugin :newgem

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'uchardet' do
  developer 'Dmitri Goutnik', 'dg@syrec.org'
  self.readme_file = 'README.rdoc'
  self.extra_rdoc_files = ['README.rdoc']
  self.rubyforge_name = name
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# remove_task :default
# task :default => [:spec, :features]
