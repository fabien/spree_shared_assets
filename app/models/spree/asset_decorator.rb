Spree::Asset.class_eval do
  
  attr_accessible :variant_ids
  attr_accessible :offset_x, :offset_y
  
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
  
  scope :for_variants_of_product, lambda { |product|
    {
      :joins      => [:variants, :assets_shares],
      :conditions => { :spree_variants => { :product_id => product.id } },
      :select     => "DISTINCT spree_assets.*, spree_assets_shares.shareable_id as shareable_id",
      :order      => "spree_assets.position ASC"
    }
  }
  
  scope :for_product, lambda { |product|
    {
      :joins      => [:assets_shares],
      :conditions => { :spree_assets_shares => { :shareable_id => product.id, :shareable_type => 'Spree::Product' } },
      :select     => "DISTINCT spree_assets.*, spree_assets_shares.shareable_id as shareable_id",
      :order      => "spree_assets.position ASC"
    }
  }
  
end