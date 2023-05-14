require 'simplecov'
require 'simplecov-cobertura'
SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter
SimpleCov.start

require 'bundler/setup'
require 'sexy_slug'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  use_metadata_locale = -> example do
    locale = example.metadata[:locale] || :en
    I18n.with_locale(locale) { example.run }
  end

  config.around(:each, &use_metadata_locale)
end

RSpec::Matchers.define(:become) do |expected|
  match { |obj| SexySlug.from(obj) == expected }
  failure_message do |obj|
    "'#{obj}' should become '#{expected}' but was '#{SexySlug.from(obj)}'"
  end
end

I18n.available_locales = SexySlug::LOCALES
