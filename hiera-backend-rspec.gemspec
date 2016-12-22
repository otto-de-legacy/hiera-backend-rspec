# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hiera-backend-rspec/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'hiera-backend-rspec'
  gem.version       = HieraBackendRspec::VERSION
  gem.authors       = ['Matthias Splieth', 'Martha Rohte']
  gem.email         = %w{matthias.splieth@otto.de martha.rohte@otto.de}
  gem.description   = 'Rspec backend for hiera'
  gem.summary       = 'Rspec backend for hiera'
  gem.homepage      = 'https://github.com/otto-de/hiera-backend-rspec'
  gem.license       = 'Apache 2.0'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = %w{lib}

  gem.add_dependency 'hiera'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'cane'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'codeclimate-test-reporter'
end
