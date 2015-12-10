module Gutentag
  module Multitenancy
    module TagExtensions

      def self.included(base)
        base.attr_accessible :tenant_id if ::ActiveRecord::VERSION::MAJOR == 3

        base.class_eval do
          scope :by_tenant_id, ->(tenant_id) { where tenant_id: tenant_id }
        end

        base.extend ClassMethods
      end

      module ClassMethods
        def find_by_name_and_tenant_id(name, tenant_id)
          where(tenant_id: tenant_id).find_by_name(name)
        end

        def find_or_create_by_name_and_tenant_id(name, tenant_id)
          find_by_name_and_tenant_id(name, tenant_id) || create(name: name, tenant_id: tenant_id)
        end
      end
    end
  end
end
