$LOAD_PATH.push File.expand_path('lib', __dir__)

Gem::Specification.new do |gem|
  gem.name = 'administrate-field-jsonb'
  gem.version = '0.4.3'
  gem.authors = ['Sergey Volkov', 'Codica']
  gem.email = ['sergvolkov.codica@gmail.com']
  gem.homepage = 'https://github.com/codica2/administrate-field-jsonb'
  gem.summary = 'JSONb field plugin for Administrate'
  gem.description = gem.summary
  gem.license = 'MIT'

  gem.require_paths = ['lib']
  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.add_runtime_dependency 'administrate', '< 1.0.0'
  gem.add_runtime_dependency 'rails', '>= 4.2'

  gem.add_development_dependency 'rspec', '~> 3.7'
end
