Gutentag.tag_validations = lambda { |klass|
  klass.validates :name,
    presence: true,
    uniqueness: {case_sensitive: false, scope: :tenant_id}
}

require "gutentag/multitenancy/version"
require "gutentag/multitenancy/tenant_tagger"
require "gutentag/multitenancy/taggable"
require "gutentag/multitenancy/engine"
require "gutentag/multitenancy/tag_extensions"
require "#{Gutentag::Engine.root}/app/models/gutentag/tag.rb"

Gutentag::Tag.send :include, Gutentag::Multitenancy::TagExtensions

