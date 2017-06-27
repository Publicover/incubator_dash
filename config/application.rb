require_relative 'boot'

require 'rails/all'

require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IncubatorDash
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.active_job.queue_adapter= :delayed_job

    config.assets.initialize_on_precompile = false

    config.paperclip_defaults = {
      :storage => :s3,
      :s3_region => 'us-east-2',
      :url =>':s3_domain_url',
      :path => '/:class/:attachment/:id_partition/:style/:filename',
      :s3_credentials => {
        :bucket => ENV['S3_BUCKET_NAME'],
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      }
    }

    # config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    # config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
    # config.assets.precompile += %w( .svg .eot .woff .ttf)
  end
end
