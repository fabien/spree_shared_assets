Deface::Override.new(
  :virtual_path => "admin/images/edit",
  :name => "edit_thumbnail",
  :replace => "[data-hook='thumbnail']",
  :partial => 'admin/images/thumbnail',
  :disabled => false)