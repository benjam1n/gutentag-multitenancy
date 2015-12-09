require "#{Gutentag::Engine.root}/app/models/gutentag/tag.rb"

module Gutentag
  module Multitenancy

    class Engine < ::Rails::Engine
      engine_name :gutentag_multitenancy

      ActiveSupport.on_load :active_record do
        Gutentag::Tag.class_eval do
          attr_accessible :tenant_id if ::ActiveRecord::VERSION::MAJOR == 3

          scope :by_tenant_id, ->(tenant_id) { where tenant_id: tenant_id }

          def self.find_by_name_and_tenant_id(name, tenant_id)
            where(tenant_id: tenant_id).find_by_name(name)
          end

          def self.find_or_create_by_name_and_tenant_id(name, tenant_id)
            find_by_name_and_tenant_id(name, tenant_id) || create(name: name, tenant_id: tenant_id)
          end
        end

        include Taggable
      end
    end

  end
end
