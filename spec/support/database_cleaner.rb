# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:all) do
    # DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:all, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:all) do
    DatabaseCleaner.start
  end

  config.after(:all) do
    DatabaseCleaner.clean
  end

  config.after(:all) do
  end
end
