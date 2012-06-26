module ProductsHelper

  def variant_images_hash(product)
    
    
    product.variant_images.inject({}){|h, img| (h['xx'] ||= []) << img; h }
  end
  
end