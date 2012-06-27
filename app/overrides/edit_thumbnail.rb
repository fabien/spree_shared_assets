Deface::Override.new(
  :virtual_path => "spree/admin/images/edit",
  :name => "edit_thumbnail",
  :replace => "[data-hook='thumbnail']",
  :partial => 'spree/admin/images/thumbnail',
  :disabled => false)