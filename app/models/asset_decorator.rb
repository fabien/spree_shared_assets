Spree::Asset.class_eval do
  
  has_many :assets_shares, :dependent => :destroy, :class_name => 'Spree::AssetsShare'
  has_many :variants, 
              :through => :assets_shares, 
              :source => :shareable, 
              :source_type => "Spree::Variant", 
              :class_name => "Spree::Variant"
  has_many :products, 
              :through => :assets_shares, 
              :source => :shareable, 
              :source_type => "Spree::Product", 
              :class_name => "Spree::Product"
  
  def assignments
    (products + variants).uniq
  end
  
  scope :for_product, lambda { |product|
    {
      :joins      => [:variants, :assets_shares],
      :conditions => { :spree_variants => { :product_id => product.id } },
      :select     => "DISTINCT spree_assets.*, spree_assets_shares.shareable_id as shareable_id",
      :order      => "spree_assets.position ASC"
    }
  }
  
end