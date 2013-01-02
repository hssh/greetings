lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'greetings/version'

Gem::Specification.new do |gem|
  gem.name          = "greetings"
  gem.version       = Greetings::VERSION
  gem.authors       = ["hssh"]
  gem.email         = ["hssh@hssh.jp"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.add_runtime_dependency('sinatra',   ['~> 1.3.3'])
  gem.add_runtime_dependency('haml',      ['~> 3.1.7'])
  gem.add_runtime_dependency('sass',      ['~> 3.2.4'])
  gem.add_runtime_dependency('rdiscount', ['~> 1.6.8'])
  gem.add_runtime_dependency('compass',   ['~> 0.12.2'])
  gem.add_runtime_dependency('mongo',     ['~> 1.8.0'])
  gem.add_runtime_dependency('bson_ext',  ['~> 1.8.0'])

  gem.add_development_dependency('debugger', ['~> 1.2.3'])

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
