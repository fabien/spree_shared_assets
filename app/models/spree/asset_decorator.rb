Spree::Asset.class_eval do
  
  attr_accessible :variant_ids
  attr_accessible :offset_x, :offset_y
  
  has_many :assets_shares, :dependent => :destroy, :class_name => 'Spree::AssetsShare'
  has_many :variants, 
              :through => :assets_shares, 
              :source => :shareable, 
              :source_type => "Spree::Variant", 
              :class_name => "Spree::Variant"
  
  def assignments
    variants.uniq
  end
  
  scope :for_product, lambda { |product|
    {
      :joins      => [:variants, :assets_shares],
      :conditions => { :spree_variants => { :product_id => product.id } },
      :select     => "DISTINCT spree_assets.*",
      :order      => "spree_assets.position ASC"
    }
  }
    
end