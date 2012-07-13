Spree::Product.class_eval do
 
  has_many :assets_shares, 
              :dependent => :destroy, 
              :as => :shareable, 
              :include => :asset,
              :class_name => "Spree::AssetsShare"
    
  def variant_images
    Spree::Image.for_product(self)
  end
  
  alias_method :images, :variant_images
    
end