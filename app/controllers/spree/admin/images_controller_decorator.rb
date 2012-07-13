module Spree
  module Admin
    ImagesController.class_eval do

      private

      def load_data
        @product = Spree::Product.find_by_permalink(params[:product_id])
      end

      def set_viewable
        @image.viewable = @product
        
        assign_to_product = params[:shareable_id] && !params[:shareable_id].blank?
        if assign_to_product # Check if "Product" option was selected
          # Assign to product
          @image.variants << @product.master unless @image.variants.include?(@product.master)
          params.delete(:shareable_id)
        else
          # "Product" option not selected, delete if it exists 
          @image.variants.delete(@product.master)
        end  
        
        # Check if at least one variant selected, if not assign to "Product"
        variant_ids = (params[:variant_ids] || []).select { |i| !i.blank? }
        if variant_ids.any?
          @image.variant_ids = variant_ids
        else
          # No variants or Product specified, default to at least product assignment
          @image.variants = [@product.master]
        end
      end

      def destroy_before
      end
    end
  end
end