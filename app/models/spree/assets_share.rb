class Spree::AssetsShare < ActiveRecord::Base

  belongs_to :asset, :class_name => "Spree::Asset"
  belongs_to :shareable, :polymorphic => true, :primary_key => :id
  
end
