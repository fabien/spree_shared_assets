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
    return (Spree::Asset.for_product(self) + Spree::Asset.for_variants_of_product(self)).uniq.sort_by(&:position)
  end
    
end