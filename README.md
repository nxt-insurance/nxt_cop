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

You do not need to include rubocop directly in your application's dependencies. nxt_copt will include a specific version of `rubocop` that is shared across all projects.

It is also possible to override styles or add styles to your application.

```
inherit_gem:
  nxt_cop:
    - default.yml

AllCops:
  Exclude:
    - db/schema.rb
    - db/migrate/*.rb
```
