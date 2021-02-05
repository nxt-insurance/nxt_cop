# nxt_cop

Getsafe shared Rubocop Config.

## Installation

Add this line to your application's Gemfile:

```ruby
group :test, :development do
  gem 'nxt_cop'
end
```

Or, for a Ruby library, add this to your gemspec:

```ruby
spec.add_development_dependency 'nxt_cop'
```

And then run:

```bash
$ bundle install
```

## Usage

Create a `.rubocop.yml` with the following directives:

```yaml
inherit_gem:
  nxt_cop:
    - default.yml
```

Now, run:

```bash
$ bundle exec rubocop
```

You do not need to include rubocop directly in your application's dependencies. nxt_cop will include a specific version of `rubocop` that is shared across all projects.

It is also possible to override styles or add styles to your application.

**NOTE:** Don't configure `AllCops` as it will override many of the rules in this gem.

```
inherit_gem:
  nxt_cop:
    - default.yml

Lint/Style:
  Exclude:
    - db/schema.rb
    - db/migrate/*.rb
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Release a new version

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nxt-insurance/nxt_cop.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
