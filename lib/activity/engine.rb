module Activity
  class Engine < ::Rails::Engine
    isolate_namespace Activity
    config.generators.api_only = true
  end
end
