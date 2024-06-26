lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nxt_cop/version'

Gem::Specification.new do |spec|
  spec.name          = 'nxt_cop'
  spec.version       = NxtCop::VERSION
  spec.authors       = ['Scott Livingstone']

  spec.summary       = 'Getsafe shared Rubocop.'
  spec.homepage      = 'https://github.com/nxt-insurance/nxt_cop'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/nxt-insurance/nxt_cop'
    spec.metadata['changelog_uri'] = 'https://github.com/nxt-insurance/nxt_cop/CHANGELOG.md'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3.2'

  spec.add_dependency 'rubocop', '~> 1.60'
  spec.add_dependency 'rubocop-capybara', '~> 2.21'
  spec.add_dependency 'rubocop-factory_bot', '~> 2.26'
  spec.add_dependency 'rubocop-rails', '~> 2.8'
  spec.add_dependency 'rubocop-rspec', '~> 3.0'
  spec.add_dependency 'rubocop-rspec_rails', '~> 2.30'
  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec_junit_formatter'
end
