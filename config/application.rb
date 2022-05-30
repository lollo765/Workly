require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DevGig
  class Application < Rails::Application
  # Don't generate system test files.
  #config.generators.system_tests = nil
    config.generators do |g|
      g.test_framework = false
    end
  end
end
