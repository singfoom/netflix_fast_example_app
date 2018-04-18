require 'simplecov'
SimpleCov.start
require 'rspec-benchmark'
RSpec.configure do |config|
  config.include RSpec::Benchmark::Matchers
  config.before(:each) do
    SimpleCov.command_name "RSpec:#{Process.pid.to_s}#{ENV['TEST_ENV_NUMBER']}"
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.color = true

  if !config.files_to_run.one?
    SimpleCov.start 'rails' do
      add_group 'Serializers', 'app/serializers'
    end
  end
end
