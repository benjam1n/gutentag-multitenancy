module Gutentag
  module Multitenancy

    class TenantTagger
      def initialize(tenant_id)
        @tenant_id = tenant_id
      end

      def find_by_name(name)
        Gutentag::Tag.find_by_name_and_tenant_id(name, tenant_id)
      end

      def find_or_create(name)
        Gutentag::Tag.find_or_create_by_name_and_tenant_id(name, tenant_id)
      end

      private

      attr_reader :tenant_id
    end

  end
end
