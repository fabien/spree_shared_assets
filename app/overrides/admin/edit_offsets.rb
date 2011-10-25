Deface::Override.new(
  :virtual_path => "admin/images/edit",
  :name => "edit_offsets",
  :insert_after => "[data-hook='thumbnail']",
  :partial => 'admin/images/offsets',
  :disabled => false)