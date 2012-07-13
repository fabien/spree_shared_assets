Spree::Variant.class_eval do

  has_many :assets_shares, 
              :dependent => :destroy, 
              :as => :shareable, 
              :include => :asset, 
              :class_name => 'Spree::AssetsShare'
  
  has_many :images, 
              :source => :asset, 
              :foreign_key => "asset_id", 
              :through => :assets_shares, 
              :class_name => "Spree::Image", 
              :dependent => :destroy, 
              :order => "spree_assets.position ASC"
  
end