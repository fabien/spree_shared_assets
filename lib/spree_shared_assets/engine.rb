module Spree
  module SharedAssets
    class Engine < Rails::Engine
      engine_name 'spree_shared_assets'

      config.autoload_paths += %W(#{config.root}/lib)

      # use rspec for tests
      config.generators do |g|
        g.test_framework :rspec
      end

      initializer "spree.shared_assets.environment", :before => :load_config_initializers do |app|
        Spree::SharedAssets::Config = Spree::SharedAssetsConfiguration.new
      end

      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
          Rails.application.config.cache_classes ? require(c) : load(c)
        end

        Dir.glob(File.join(File.dirname(__FILE__), "../../app/overrides/*.rb")) do |c|
          Rails.application.config.cache_classes ? require(c) : load(c)
        end
      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end
