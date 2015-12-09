module Gutentag
  module Multitenancy

    module Taggable
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def has_many_tags
          super
          include InstanceMethodsOnActivation
        end
      end

      module InstanceMethodsOnActivation
        def tenant_id
          raise NotImplementedError, 'taggable must implement'
        end

        private

        def persist_tags
          persister = Gutentag::Persistence.new(self)
          persister.tagger = TenantTagger.new(tenant_id)
          persister.persist
        end
      end
    end

  end
end
