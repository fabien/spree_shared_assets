Spree::Product.class_eval do
 
  has_many :assets_shares, 
              :dependent => :destroy, 
              :as => :shareable, 
              :include => :asset,
              :class_name => "Spree::AssetsShare"
  has_many :images,
              :source => :asset, 
              :foreign_key => "asset_id", 
              :through => :assets_shares, 
              :class_name => "Spree::Image", 
              :order => "spree_assets.position ASC"
  
  def all_images
    return images unless has_variants?
    return (images + variant_images).uniq.sort_by(&:position)
  end
  
  def variant_images
    Spree::Asset.for_product(self)
  end
  
end