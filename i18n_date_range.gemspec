# frozen_string_literal: true

require_relative "lib/i18n_date_range/version"

Gem::Specification.new do |spec|
  spec.name          = "i18n_date_range"
  spec.version       = I18nDateRange::VERSION
  spec.authors       = ["pabois"]
  spec.email         = ["pierreandre.boissinot@noesya.coop"]

  spec.summary       = "Add helper to display a date range"
  spec.description   = "Add a new helper to display properly a date range (ex: From 8 to 9 September 2023)"
  spec.homepage      = "https://github.com/noesya/i18n_date_range"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/noesya/i18n_date_range/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end