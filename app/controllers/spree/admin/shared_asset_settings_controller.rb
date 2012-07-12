module Spree
  module Admin
    class SharedAssetSettingsController < Spree::Admin::BaseController
      def update
        Spree::SharedAssets::Config.set(params[:preferences])
        respond_to do |format|
          format.html {
            redirect_to admin_shared_asset_settings_path
          }
        end
      end
    end
  end
end
