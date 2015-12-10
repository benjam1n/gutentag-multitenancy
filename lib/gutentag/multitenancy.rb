Gutentag.tag_validations = lambda { |klass|
  klass.validates :name,
    presence: true,
    uniqueness: {case_sensitive: false, scope: :tenant_id}
}


require "#{Gutentag::Engine.root}/app/models/gutentag/tag.rb"

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

require "gutentag/multitenancy/version"
require "gutentag/multitenancy/tenant_tagger"
require "gutentag/multitenancy/taggable"
require "gutentag/multitenancy/engine"
