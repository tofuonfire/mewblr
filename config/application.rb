require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NewApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false
    end

    # libディレクトリ以下のファイルが、下記のディレクトリ・ファイル構成と命名の規約に従うと、
    # development環境ではAutoloadされ、production環境ではEagerLoadされるようになります
    config.paths.add 'lib', eager_load: true
  end
end