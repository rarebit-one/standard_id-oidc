source "https://rubygems.org"

gemspec

gem "puma"

gem "sqlite3"

gem "propshaft"

# Rails 8.1.3.1 calls `JSON.parse(json, options)` positionally in
# ActiveSupport::JSON.decode, but json 3.0 made those options keyword-only.
# Any schema load touching a `t.json` column then dies with ArgumentError.
# Drop this pin once Rails ships a json 3 compatible activesupport.
gem "json", "< 3"

gem "standard_id", path: "../standard_id" unless ENV["CI"]

group :development, :test do
  gem "rspec-rails", "~> 8.0"
  gem "shoulda-matchers", "~> 7.0"
  gem "simplecov", "~> 0.22", require: false
end

# Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
gem "rubocop-rails-omakase", require: false
gem "brakeman", require: false
gem "bundler-audit", require: false
