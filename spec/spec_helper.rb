# simplecov needs to be started before everything else
require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/config/'
  add_filter '/spec/'
# refuse_coverage_drop
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

# grab support files
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# check for migrations
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # expectation config
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # mock config
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # factories
  config.include FactoryBot::Syntax::Methods

  # fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  # other configs
  config.infer_spec_type_from_file_location!
  config.disable_monkey_patching!
  config.default_formatter = 'doc' if config.files_to_run.one? # single file output
  config.profile_examples = 10 # slowest examples
  config.order = :random # random ordering of examples
  Kernel.srand config.seed
  config.filter_rails_from_backtrace! # filter gems from backtrace
end
