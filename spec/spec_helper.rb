# encoding: utf-8
require 'simplecov'
SimpleCov.start
ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require_relative '../app/shiori'
require_relative '../app/models/bookmark'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  # Capybara Settings
  Capybara.app = Shiori
  config.include Capybara::DSL

  # DBのデータをテスト毎に空にしておく
  config.before :each do
    Bookmark.destroy_all
  end
end
