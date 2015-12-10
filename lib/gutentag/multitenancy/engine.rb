module Gutentag
  module Multitenancy

    class Engine < ::Rails::Engine
      engine_name :gutentag_multitenancy

      ActiveSupport.on_load :active_record do
        include Taggable
      end
    end

  end
end
