require 'refinerycms-base'

module Refinery
  module Registrations
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "registrations"
          plugin.activity = {
            :class => Registration,
            :title => 'surname'
          }
        end
      end
    end
  end
end
