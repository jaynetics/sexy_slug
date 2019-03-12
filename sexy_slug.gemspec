require File.join(__dir__, 'lib', 'sexy_slug', 'version')

Gem::Specification.new do |s|
  s.name        = 'sexy_slug'
  s.version     = SexySlug::VERSION
  s.license     = 'MIT'

  s.summary     = 'Builds slugs from Strings'
  s.description = 'Build sexy slugs for your URL paths.'\
                  'A lightweight, opinionated alternative to StringEx/ActAsUrl.'

  s.authors     = ['Janosch Müller']
  s.email       = ['janosch84@gmail.com']
  s.homepage    = 'https://github.com/jaynetics/sexy_slug'

  s.files       = Dir[File.join('lib', '**', '*.rb')]

  s.required_ruby_version = '>= 2.3.0'

  s.add_dependency 'activesupport', '~> 5.0'

  s.add_development_dependency 'bundler', '~> 2.0'
  s.add_development_dependency 'rake', "~> 12.0"
  s.add_development_dependency 'rspec', "~> 3.0"
end
