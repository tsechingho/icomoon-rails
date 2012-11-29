# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'icomoon-rails/version'

Gem::Specification.new do |gem|
  gem.name          = 'icomoon-rails'
  gem.version       = Icomoon::Rails::VERSION
  gem.authors       = ['Tse-Ching Ho']
  gem.email         = ['tsechingho@gmail.com']
  gem.description   = %q{IcoMoon is an icon set rendered by css font-face way. This gem integrates IcoMoon with Rails asset pipeline for easy of use.}
  gem.summary       = %q{Integrate font-faced icons of IcoMoon with Rails asset pipeline}
  gem.homepage      = 'https://github.com/tsechingho/icomoon-rails'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'railties', '>= 3.1.1'
  gem.add_dependency 'sass-rails', '>= 3.1.1'

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'thor', '~> 0.14'
end
