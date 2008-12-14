# Needed to import datamapper and other gems
require 'rubygems'
require 'pathname'

# Add all external dependencies for the plugin here
gem 'dm-core', '~>0.9.8'
require 'dm-core'
require 'dm-validations'
require 'dm-types'

# Require plugin-files
require Pathname(__FILE__).dirname.expand_path / 'dm-slug' / 'has' / 'slug.rb'


# Include the plugin in Resource
module DataMapper
  module Resource
    module ClassMethods
      include DataMapper::Has::Slug
    end # module ClassMethods
  end # module Resource
end # module DataMapper
