module DataMapper
  module Has
    module Slug

      ##
      # Methods that should be included in DataMapper::Model.
      # Normally this should just be your generator, so that the namespace
      # does not get cluttered. ClassMethods and InstanceMethods gets added
      # in the specific resources when you fire is :example
      ##

      def has_slug(options = {})
        options = { :on => :name, :called => :slug, :length => 50 }.merge(options)
        
        if properties.has_property? options[:on]
          p = properties[options[:on]]
          p_opts = {:length => p.length, :lazy => p.lazy?, :nullable => p.nullable?,
            :unique_index => (p.unique or p.unique_index)}
        else
          p_opts = {:length => options[:length]}
        end
        property options[:called], DataMapper::Types::Slug, p_opts
          
        before :valid? do
          attribute_set(options[:called], self.send(options[:on]))
        end
      end
    end # Slug
  end # Has
end # DataMapper
