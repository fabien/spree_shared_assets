Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_shared_assets'
  s.version     = '0.60.0'
  s.summary     = 'Associate images with multiple variants'
  s.required_ruby_version = '>= 1.9.2'

  s.author      = 'Fabien Franzen'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '>= 0.70.0')
end
