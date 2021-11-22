# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "mini-rails"
  spec.version = "1.0.0"
  spec.authors = ["Dane Balia"]
  spec.email = ["daneb@tuta.io"]

  spec.summary = "A tiny, mini, version of Rails"
  spec.description = "Framework built as per of owningrails.com class"
  spec.homepage = "https://danebalia.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "minitest", "~> 5.0"
  spec.add_dependency "rake", "~> 13.0"
  spec.add_dependency "rubocop", "~> 1.21"
  spec.add_dependency "sqlite3", "~> 1.3"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
