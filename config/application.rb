require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MarvelVsPeople
  class Application < Rails::Application
    config.load_defaults 5.2

    marvel_client = Marvel::Client.new
    marvel_client.api_key = '720411e44edb8fe18f5f6061ada61d8e'
    marvel_client.private_key = '65be946f16213b54e48025d9cc45e3f335d7541b'
    config.marvel_client = marvel_client

    def database_exists?
      ActiveRecord::Base.connection
    rescue ActiveRecord::NoDatabaseError
      false
    else
      true
    end

    # The code below is intended to run when the server starts to update the
    # starting_at value from which the ranking is determined.
    config.after_initialize do
      # Force loading of Ranking model.
      if database_exists? &&
         ActiveRecord::Base.connection.tables.include?('rankings')
        require 'ranking'
        unless defined?(Ranking).nil?
          Ranking.update(Time.current.in_time_zone('America/Santiago').midnight)
        end
      end
    end
  end
end
