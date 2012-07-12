Deface::Override.new(
  :virtual_path => "spree/admin/images/edit",
  :name => "edit_offsets",
  :insert_after => "[data-hook='thumbnail']",
  :partial => 'spree/admin/images/offsets',
  :disabled => false)