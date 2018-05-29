lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uchardet/version'

Gem::Specification.new do |spec|
  spec.name          = 'uchardet'
  spec.version       = Uchardet::VERSION
  spec.authors       = ['Dmitri Goutnik']
  spec.email         = ['dg@syrec.org']

  spec.summary       = 'Fast character set encoding detection using International Components for Unicode library.'
  spec.homepage      = 'https://github.com/dmgk/uchardet'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.extensions    = ['ext/extconf.rb']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rake-compiler', '~> 1.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
