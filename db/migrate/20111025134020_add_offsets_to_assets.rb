class AddOffsetsToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :offset_x, :int, :default => 50, :null => false
    add_column :assets, :offset_y, :int, :default => 50, :null => false
  end
 
  def self.down
    remove_column :assets, :offset_x
    remove_column :assets, :offset_y
  end
end
