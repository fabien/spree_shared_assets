namespace :spree_shared_assets do
  desc "Copies all migrations and assets (NOTE: This will be obsolete with Rails 3.1)"
  task :install do
    Rake::Task['spree_shared_assets:install:migrations'].invoke
  end
  
  task :copy_shared_assets => :environment do
    Spree::Asset.where(:type => 'Spree::Image').each do |asset|
      Spree::AssetsShare.create(:asset => asset, :shareable => asset.viewable)
    end
  end

  namespace :install do
    desc "Copies all migrations (NOTE: This will be obsolete with Rails 3.1)"
    task :migrations do
      source = File.join(File.dirname(__FILE__), '..', '..', 'db')
      destination = File.join(Rails.root, 'db')
      Spree::FileUtilz.mirror_files(source, destination)
    end
  end

end