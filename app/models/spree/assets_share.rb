class Spree::AssetsShare < ActiveRecord::Base

  attr_accessible :asset, :shareable

  belongs_to :asset, :class_name => "Spree::Asset"
  belongs_to :shareable, :polymorphic => true, :primary_key => :id
  
end
