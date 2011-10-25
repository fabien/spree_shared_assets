module Spree::SharedAssets
  class Config < Spree::Config
    class << self
      def instance
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        SharedAssetsConfiguration.find_or_create_by_name("Shared Assets configuration")
      end
    end
  end
end