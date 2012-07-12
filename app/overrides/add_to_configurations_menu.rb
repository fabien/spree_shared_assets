Deface::Override.new(
  :virtual_path => "spree/admin/configurations/index",
  :name => "shared_assets_admin_configurations_menu",
  :insert_bottom => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
  :text => "<%= configurations_menu_item(t('shared_asset_settings.title'), admin_shared_asset_settings_path, t('shared_asset_settings.description')) %>",
  :disabled => false)
