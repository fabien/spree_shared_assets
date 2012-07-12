Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resource :shared_asset_settings
  end
end