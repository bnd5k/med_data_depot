require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv.load(File.expand_path("../../.env", __FILE__)) if File.exist?(File.expand_path("../../.env", __FILE__))

module MedDataDepot
  class Application < Rails::Application

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths << Rails.root.join('lib')
    config.after_initialize do
      Rails.application.routes.default_url_options[:host] = ENV['HOST']
    end
  end
end
