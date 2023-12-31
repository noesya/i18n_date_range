# frozen_string_literal: true

require "bundler"

Bundler.require :default, :development
Combustion.initialize! do
  config.i18n.default_locale = :fr
  config.active_support.cache_format_version = 7.0
end

require "i18n_date_range"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
