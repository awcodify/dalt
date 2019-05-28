
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Dalt/version'

Gem::Specification.new do |spec|
  spec.name          = 'dalt'
  spec.version       = Dalt::VERSION
  spec.authors       = ['whatdacode']
  spec.email         = ['awcodify@gmail.com']

  spec.summary       = 'Alternate parse'
  spec.description   = 'If date parsing is failing, then we use alternate'
  spec.homepage      = 'https://github.com/whatdacode/dalt'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
