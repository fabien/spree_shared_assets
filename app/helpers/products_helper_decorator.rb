module ProductsHelper

  def variant_images_hash(product)
    product.variant_images.inject({}){|h, img| (h[img.shareable_id] ||= []) << img; h }
  end
  
end